require 'google/api_client'
require 'google/api_client/auth/installed_app'
require 'nokogiri'
require 'launchy'

SERVICE_ACCOUNT_EMAIL = '897576187605-3sv0ecr29m4clj9uampliu93dn5ea1qe@developer.gserviceaccount.com'

## Path to the Service Account's Private Key file #
SERVICE_ACCOUNT_PKCS12_FILE_PATH = 'public/images/My Project-b7d0c9c1daf3.p12'

CLIENT_ID = '897576187605-urqm54617andd5pqsg9uhi8k9ulqoams.apps.googleusercontent.com'
CLIENT_SECRET = 'bPJqzy3laEzrOevr-f6LGOik'
OATH_SCOPE = 'https://www.googleapis.com/auth/drive'
OATH_SCOPE = 'https://www.googleapis.com/auth/drive.file'
OATH_SCOPE2 = 'https://www.googleapis.com/auth/drive.scripts'
REDIRECT_URI = 'urn:ietf:wg:oauth:2.0:oob'

module Post
  class Script

    def initialize(var)
      @select = var
      @gform = GoogleForm.new
      @gform.select_id = @select.id
      @gform.save
  
    end

    def get_assessments
        drive = @client.discovered_api('drive', 'v2')

      file_id = @select.resource_id

      result = @client.execute(
          :api_method => drive.files.get,
          :parameters => { 'fileId' => file_id })
          file = result.data
          result = @client.execute(:uri => file['exportLinks']['text/html'])

      f = "#{result.body}" #define the result of the request as the body of the nokogiri HTML
      doc = Nokogiri::HTML(f)

      out_file = File.new("public/#{@select.id}.html", "w")

      #parse

      doc.search('//table/tbody/tr/td/p/span').each do |header| #sets a class for assessment table to be queried by Nokogiri
        if header.content == "SBAC Assessment"
          header.parent.parent.parent.parent.parent['class']= "new_class_aquestion"
        end
      end

      if doc.search('//table[@class = "new_class_aquestion"]').any? #uses class to find the question and prompt
        doc.search('//table[@class = "new_class_aquestion"]').each do |table|
          table.search('//table/tbody/tr/td/table/tbody/tr/td/p/span').each do |assessment| #defines prompt and question to be assembled
            out_file.puts("#{assessment}")
            
          end
        end
      end
      out_file.close
      prompt = Array.new
      question = Array.new
      i = 0
      j = 0
      f = File.open(out_file)
      doc = Nokogiri::HTML(f)
      f.close
      doc.search('span').each do |span|
        if span.content == "Prompt"
            prompt[i] = span.next_element.content
            i = i + 1
        end

        if span.content == "Question"
            question[j] = span.next_element.content
             j = j + 1
        end
      end
      File.delete(out_file)

      out_file = File.new("public/#{@select.id}_#{@gform.id}.gs", "w")
      out_file.puts("function createFormTrigger() {
  ScriptApp.newTrigger('createForm')
  .timeBased()
  .after(1)
  .create();
}

function createForm() {
  var form = FormApp.create('#{@select.id}_#{@gform.id}_form');

")

      prompt.each_with_index do |prompt, index|
        out_file.puts("
  form.addItem()
  .setTitle('#{prompt} #{question[index]}')
  .showOtherOption(true);
  
")
      end
      out_file.puts("}")
    end

    def post
key = Google::APIClient::PKCS12.load_key(SERVICE_ACCOUNT_PKCS12_FILE_PATH, 'notasecret')
    asserter = Google::APIClient::JWTAsserter.new(SERVICE_ACCOUNT_EMAIL,
        ['https://www.googleapis.com/auth/drive','https://www.googleapis.com/auth/drive.file','https://www.googleapis.com/auth/drive.scripts'], key)
    client = Google::APIClient.new(
  :application_name => 'Example Ruby application',
  :application_version => '1.0.0'
)
    client.authorization = asserter.authorize()
    client

drive = client.discovered_api('drive', 'v2')

media = Google::APIClient::UploadIO.new('public/script.json', 'vnd.google-apps.script')

upload = client.execute(:api_method => drive.files.insert,
               :parameters => { 'convert' => 'true' },
               :media => media)

puts "@@@@@@@@@@@@@ #{upload.data.alternateLink}"

revision = client.execute(:api_method => drive.revisions.update,
               :parameters => { 'fileId' => upload.data.id, 'revisionId' => 1 },
               :body_object => { 'published' => 'true', 'publishAuto' => 'true' }
               )

permission = client.execute(:api_method => drive.permissions.insert, 
              :parameters => { 'fileId' => upload.data.id },
              :body_object => {'withLink' => 'true', 'type' => 'anyone', 'role' => 'writer', 'value' => '' }
              )

script = client.execute(:api_method => drive.files.list,
               :parameters => { q: 'mimeType = "vnd.google-apps.script"' }
               )

form = client.execute(:api_method => drive.files.list,
               :parameters => { q: 'mimeType = "vnd.google-apps.form"' }
               )

script.data.items.each do |item|
  puts item
end

form.data.items.each do |item|
  puts item.title
end



    end
  end
attr_reader :var
end
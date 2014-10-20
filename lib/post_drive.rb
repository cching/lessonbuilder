require 'google/api_client'
require 'google/api_client/auth/installed_app'

SERVICE_ACCOUNT_EMAIL = '897576187605-3sv0ecr29m4clj9uampliu93dn5ea1qe@developer.gserviceaccount.com'

## Path to the Service Account's Private Key file #
SERVICE_ACCOUNT_PKCS12_FILE_PATH = 'public/images/My Project-b7d0c9c1daf3.p12'

module Post
class Questions

def initialize(var)
  @select = var
end

def post_question
# Initialize the client.

key = Google::APIClient::PKCS12.load_key(SERVICE_ACCOUNT_PKCS12_FILE_PATH, 'notasecret')
    asserter = Google::APIClient::JWTAsserter.new(SERVICE_ACCOUNT_EMAIL,
        'https://www.googleapis.com/auth/drive', key)
    client = Google::APIClient.new(
  :application_name => 'Example Ruby application',
  :application_version => '1.0.0'
)
    client.authorization = asserter.authorize()
    client

drive = client.discovered_api('drive', 'v2')

file_id = @select.resource_id

result = client.execute(
    :api_method => drive.files.get,
    :parameters => { 'fileId' => file_id })
    file = result.data
    result = client.execute(:uri => file['exportLinks']['text/plain'])

questions = @select.xquestions.pluck(:content).join(" <br> ")

out_file = File.new("public/#{@select.id}.txt", "w")
out_file.puts("#{result.body}" + "<br>" + "Question Stems" + "<br>" + questions)
out_file.close

 media = Google::APIClient::UploadIO.new("public/#{@select.id}.txt", 'text/plain')
    result = client.execute(
      :api_method => drive.files.update,
      :body_object => file,
      :media => media,
      :parameters => { 'fileId' => file_id,
                       'uploadType' => 'multipart',
                       'convert' => 'true',
                       'alt' => 'json' })

File.delete(out_file)

end



attr_reader :var
end
end
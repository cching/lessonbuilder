require 'google/api_client'
require 'google/api_client/auth/installed_app'

SERVICE_ACCOUNT_EMAIL = '897576187605-3sv0ecr29m4clj9uampliu93dn5ea1qe@developer.gserviceaccount.com'

## Path to the Service Account's Private Key file #
SERVICE_ACCOUNT_PKCS12_FILE_PATH = 'public/images/My Project-b7d0c9c1daf3.p12'

module Fork
class Drive

def initialize(var, var2)
  @select = var
  @fork = var2

end

def fork
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

result = client.execute(
    :api_method => drive.files.get,
    :parameters => { 'fileId' => @select.resource_id })
    file = result.data
    result = client.execute(:uri => file['exportLinks']['text/html'])


out_file = File.new("public/#{@select.id}.html", "w")
out_file.puts("#{result.body}")
out_file.close

  media = Google::APIClient::UploadIO.new("public/#{@select.id}.html", "text/html") #sets the media to the file uploaded
  metadata = {
      'title' => "'#{@select.name}'",
      'description' => 'A lesson uploaded by Shoob Photography'
  }
upload = client.execute(:api_method => drive.files.insert,
               :parameters => { 'uploadType' => 'multipart', 'convert' => 'true' },
               :body_object => metadata,
               :media => media)

id = upload.data.id
revision_id = 1
 @fork.publish_id = upload.data.id
  @fork.save
revision = client.execute(:api_method => drive.revisions.update,
               :parameters => { 'fileId' => id, 'revisionId' => revision_id },
               :body_object => { 'published' => 'true', 'publishAuto' => 'true' }
               )


permission = client.execute(:api_method => drive.permissions.insert, 
              :parameters => { 'fileId' => id },
              :body_object => {'withLink' => 'true', 'type' => 'anyone', 'role' => 'reader', 'value' => '' }
              )
 
upload = client.execute(:api_method => drive.files.insert,
               :parameters => { 'uploadType' => 'multipart', 'convert' => 'true' },
               :body_object => metadata,
               :media => media)

id = upload.data.id
 @fork.resource_id = upload.data.id
  @fork.save
revision = client.execute(:api_method => drive.revisions.update,
               :parameters => { 'fileId' => id, 'revisionId' => revision_id },
               :body_object => { 'published' => 'true', 'publishAuto' => 'true' }
               )


permission = client.execute(:api_method => drive.permissions.insert, 
              :parameters => { 'fileId' => id },
              :body_object => {'withLink' => 'true', 'type' => 'anyone', 'role' => 'writer', 'value' => '' }
              )
File.delete(out_file)

end

def copy

      @select.xquestions.each do |xquestion|
      x = xquestion.dup
      x.select_id = @fork.id
      puts "#{x.id}@@@@@@@@@@@@@@@@"
      x.save
    end
    @fork.xvocabs = @select.xvocabs
    @fork.xlinks = @select.xlinks
    @fork.xaquestions = @select.xaquestions
    @fork.sources = @select.sources
    @fork.grades = @select.grades
    @fork.books = @select.books
    @fork.subjects = @select.subjects
    @fork.subsubjects = @select.subsubjects
    @fork.standards = @select.standards
    @fork.save
end
end
end
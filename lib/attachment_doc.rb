require 'google/api_client'
require 'google/api_client/auth/installed_app'

SERVICE_ACCOUNT_EMAIL = '897576187605-3sv0ecr29m4clj9uampliu93dn5ea1qe@developer.gserviceaccount.com'

## Path to the Service Account's Private Key file #
SERVICE_ACCOUNT_PKCS12_FILE_PATH = 'public/images/My Project-b7d0c9c1daf3.p12'

module Post
class Drive

def initialize(var, var2)
  @select = var
  @attachment = var2
end

def update
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

  media = Google::APIClient::UploadIO.new("#{@attachment.file.url}", 'application/msword') #sets the media to the file uploaded

  metadata = {
      'title' => "'#{@select.id}'",
      'description' => 'Picture'
  }
  upload = client.execute(:api_method => drive.files.insert, #uploads selected file
                 :parameters => { 'uploadType' => 'multipart', 'convert' => 'true' },
                 :body_object => metadata,
                 :media => media)
  upload_id = upload.data.id
  @attachment.google_url = upload.data.alternateLink
  @attachment.save

  revision = client.execute(:api_method => drive.revisions.update,
               :parameters => { 'fileId' => upload_id, 'revisionId' => 1 },
               :body_object => { 'published' => 'true', 'publishAuto' => 'true' }
               )

  permission = client.execute(:api_method => drive.permissions.insert, 
              :parameters => { 'fileId' => upload_id },
              :body_object => {'withLink' => 'true', 'type' => 'anyone', 'role' => 'writer', 'value' => '' }
              )

  result = client.execute(
    :api_method => drive.files.get,
    :parameters => { 'fileId' => upload_id })
    file = result.data
    result = client.execute(:uri => file['exportLinks']['text/html'])

    upload_body = result.body

  file_id = @select.resource_id

  result = client.execute( #gets the user's lesson from google docs
      :api_method => drive.files.get,
      :parameters => { 'fileId' => file_id })
      file = result.data
      result = client.execute(:uri => file['exportLinks']['text/html'])

  out_file = File.new("public/#{@select.id}.txt", "w") #creates a file with the user's google doc info
  out_file.puts("#{result.body}" + "<br /> #{upload_body}")
  out_file.close

   media = Google::APIClient::UploadIO.new("public/#{@select.id}.txt", 'text/html') #updates user's google doc with new resource attached
      result = client.execute(
        :api_method => drive.files.update,
        :body_object => file,
        :media => media,
        :parameters => { 'fileId' => file_id,
                         'uploadType' => 'multipart',
                         'convert' => 'true',
                         'alt' => 'json' })

  File.delete(out_file)
  File.delete(File.new("#{@attachment.file.url}"))


end
end
end
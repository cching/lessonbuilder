require 'google/api_client'
require 'google/api_client/auth/installed_app'

SERVICE_ACCOUNT_EMAIL = '897576187605-3sv0ecr29m4clj9uampliu93dn5ea1qe@developer.gserviceaccount.com'

## Path to the Service Account's Private Key file #
SERVICE_ACCOUNT_PKCS12_FILE_PATH = 'public/images/My Project-b7d0c9c1daf3.p12'

module Post
class Drive

def initialize(var, type)
  @resource = var
  @type = type
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

  media = Google::APIClient::UploadIO.new("#{@resource.file.url}", "#{@type}") #sets the media to the file uploaded

  metadata = {
      'title' => "'#{@resource.title}'",
      'description' => 'A #{@type}, uploaded by Shoob Photography'
  }
  upload = client.execute(:api_method => drive.files.insert, #uploads selected file
                 :parameters => { 'uploadType' => 'multipart' },
                 :body_object => metadata,
                 :media => media)
  @resource.google_url = upload.data.id
  @resource.url = upload.data.alternateLink
  @resource.save

  revision = client.execute(:api_method => drive.revisions.update,
               :parameters => { 'fileId' => upload.data.id, 'revisionId' => 1 },
               :body_object => { 'published' => 'true', 'publishAuto' => 'true' }
               )

  permission = client.execute(:api_method => drive.permissions.insert, 
              :parameters => { 'fileId' => upload.data.id },
              :body_object => {'withLink' => 'true', 'type' => 'anyone', 'role' => 'reader', 'value' => '' }
              )


  File.delete("#{@resource.file.url}")

end
end
end
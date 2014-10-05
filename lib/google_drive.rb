require 'google/api_client'
require 'google/api_client/auth/installed_app'

SERVICE_ACCOUNT_EMAIL = '897576187605-3sv0ecr29m4clj9uampliu93dn5ea1qe@developer.gserviceaccount.com'

## Path to the Service Account's Private Key file #
SERVICE_ACCOUNT_PKCS12_FILE_PATH = 'public/images/My Project-b7d0c9c1daf3.p12'

module Drive
class GoogleDriveNew

def initialize(var)
  @select = var
end

def upload
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

media = Google::APIClient::UploadIO.new('public/images/hello.doc', 'text/plain')
metadata = {
    'title' => "Lesson #'#{@select.id}'",
    'description' => 'Lesson made through Shoob Photography Lesson Builder'
}
upload = client.execute(:api_method => drive.files.insert,
               :parameters => { 'uploadType' => 'multipart', 'convert' => 'true' },
               :body_object => metadata,
               :media => media)

id = upload.data.id
revision_id = 1

@select.resource_id = id
@select.save

revision = client.execute(:api_method => drive.revisions.update,
               :parameters => { 'fileId' => id, 'revisionId' => revision_id },
               :body_object => { 'published' => 'true', 'publishAuto' => 'true' }
               )


permission = client.execute(:api_method => drive.permissions.insert, 
              :parameters => { 'fileId' => id },
              :body_object => {'withLink' => 'true', 'type' => 'anyone', 'role' => 'reader', 'value' => '' }
              )

end
attr_reader :var
end
end
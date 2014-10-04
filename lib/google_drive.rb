require 'google/api_client'
require 'google/api_client/auth/installed_app'

CLIENT_ID = '897576187605-urqm54617andd5pqsg9uhi8k9ulqoams.apps.googleusercontent.com'
CLIENT_SECRET = 'bPJqzy3laEzrOevr-f6LGOik'
OAUTH_SCOPE = 'https://www.googleapis.com/auth/drive'
REDIRECT_URI = 'urn:ietf:wg:oauth:2.0:oob'

module Drive
class GoogleDriveNew

def initialize(var)
  @select = var
end

def upload
# Initialize the client.
client = Google::APIClient.new(
  :application_name => 'Example Ruby application',
  :application_version => '1.0.0'
)

plus = client.discovered_api('plus')

flow = Google::APIClient::InstalledAppFlow.new(
  :client_id => CLIENT_ID,
  :client_secret => CLIENT_SECRET,
  :scope => OAUTH_SCOPE
)
client.authorization = flow.authorize

result = client.execute(
  :api_method => plus.activities.list,
  :parameters => {'collection' => 'public', 'userId' => 'me'}
)

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
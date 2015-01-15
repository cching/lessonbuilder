require 'google/api_client'
require 'google/api_client/auth/installed_app'

SERVICE_ACCOUNT_EMAIL = '897576187605-3sv0ecr29m4clj9uampliu93dn5ea1qe@developer.gserviceaccount.com'

## Path to the Service Account's Private Key file #
SERVICE_ACCOUNT_PKCS12_FILE_PATH = 'public/images/My Project-b7d0c9c1daf3.p12'

module Post
class Drive

def initialize(var, var2, var3)
  @attachment = var
  @resources = var2
  @select =  var3
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

@resources.each do |resource|

  result = client.execute(:api_method => drive.files.get, #uploads selected file
                 :parameters => { 'fileId' => resource.google_url })

  download_url = result.data.download_url

  file = client.execute(:uri => download_url)

  case resource.filetype_id 
      when 1
        @type = "application/pdf"
        @extension = ".pdf"
      when 2
        @type = "application/msword"
        @extension = ".doc"
      when 3
        @type = "image/jpeg"
        @extension = ".jpg"
    end

File.open("tmp/uploads/#{@attachment.id}#{@extension}", "wb") do |f|
    f.write file.body
end

  media = Google::APIClient::UploadIO.new("tmp/uploads/#{@attachment.id}#{@extension}", "#{@type}") #sets the media to the file uploaded
  metadata = {
      'title' => "'#{resource.title}'",
      'description' => 'A #{@type}, uploaded by Shoob Photography'
  }
  upload = client.execute(:api_method => drive.files.insert, #uploads selected file
                 :parameters => { 'uploadType' => 'multipart' },
                 :body_object => metadata,
                 :media => media)

Attachment.create(:google_url => upload.data.alternateLink, :select_id => @select.id, :name => "#{resource.title}", :file_type => "#{@extension}")

  revision = client.execute(:api_method => drive.revisions.update,
               :parameters => { 'fileId' => upload.data.id, 'revisionId' => 1 },
               :body_object => { 'published' => 'true', 'publishAuto' => 'true' }
               )

  permission = client.execute(:api_method => drive.permissions.insert, 
              :parameters => { 'fileId' => upload.data.id },
              :body_object => {'withLink' => 'true', 'type' => 'anyone', 'role' => 'writer', 'value' => '' }
              )

File.delete

end 

  file_id = @select.resource_id

  result = client.execute( #gets the user's lesson from google docs
      :api_method => drive.files.get,
      :parameters => { 'fileId' => file_id })
      file = result.data
      result = client.execute(:uri => file['exportLinks']['text/html'])



end
end
end
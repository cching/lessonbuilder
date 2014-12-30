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

if @attachment.file_type == "image"
  media = Google::APIClient::UploadIO.new("public#{@attachment.file.url}", 'image/jpeg') #sets the media to the file uploaded

  metadata = {
      'title' => "'#{@select.id}'",
      'description' => 'Picture'
  }
  upload = client.execute(:api_method => drive.files.insert, #uploads selected file
                 :parameters => { 'uploadType' => 'multipart' },
                 :body_object => metadata,
                 :media => media)
  @attachment.google_url = upload.data.selfLink
  @attachment.save

  file_id = @select.resource_id

  result = client.execute( #gets the user's lesson from google docs
      :api_method => drive.files.get,
      :parameters => { 'fileId' => file_id })
      file = result.data
      result = client.execute(:uri => file['exportLinks']['text/html'])

  end_out = "' style='width: 500.00px; height: 625.00px; margin-left: 0.00px; margin-top: 0.00px; transform: rotate(0.00rad) translateZ(0px); -webkit-transform: rotate(0.00rad) translateZ(0px);' title=''></span>"

  beginning = "<span style='overflow: hidden; display: inline-block; margin: 0.00px 0.00px; border: 0.00px solid #000000; transform: rotate(0.00rad) translateZ(0px); -webkit-transform: rotate(0.00rad) translateZ(0px); width: 500.00px; height: 625.00px;'><img alt='' src='"


  out_file = File.new("public/#{@select.id}.txt", "w") #creates a file with the user's google doc info
  out_file.puts("#{result.body}" + "<span style='overflow: hidden; display: inline-block; margin: 0.00px 0.00px; border: 0.00px solid #000000; transform: rotate(0.00rad) translateZ(0px); -webkit-transform: rotate(0.00rad) translateZ(0px); width: 237.00px; height: 300.00px;'><img alt='reddit-guy.png' src='http://commoncore.s3.amazonaws.com/attachments/files/000/000/060/original/Screen_Shot_2014-12-25_at_12.02.08_AM.JPG?1419711328' style='width: 237.00px; height: 300.00px; margin-left: 0.00px; margin-top: 0.00px; transform: rotate(0.00rad) translateZ(0px); -webkit-transform: rotate(0.00rad) translateZ(0px);' title=''></span>")
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
  File.delete('public#{@attachment.file.url}')

elsif @attachment.file_type == 'doc'
  media = Google::APIClient::UploadIO.new("public#{@attachment.file.url}", 'plain/text') #sets the media to the file uploaded

  metadata = {
      'title' => "'#{@select.id}'",
      'description' => 'doc'
  }
  upload = client.execute(:api_method => drive.files.insert, #uploads selected file
                 :parameters => { 'uploadType' => 'multipart' },
                 :body_object => metadata,
                 :media => media)
  upload_id = upload.data.id
  @attachment.google_url = upload.data.selfLink
  @attachment.save

  result = client.execute( #gets the user's lesson from google docs
      :api_method => drive.files.get,
      :parameters => { 'fileId' => upload_id })
      file = result.data
      body = client.execute(:uri => file['exportLinks']['text/html'])

  file_id = @select.resource_id

  result = client.execute( #gets the user's lesson from google docs
      :api_method => drive.files.get,
      :parameters => { 'fileId' => file_id })
      file = result.data
      result = client.execute(:uri => file['exportLinks']['text/html'])

  out_file = File.new('public/#{@select.id}.txt', "w") #creates a file with the user's google doc info
  out_file.puts("#{result.body}" + "#{body.body}")
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

elsif @attachment.file_type == 'mp3'
  media = Google::APIClient::UploadIO.new("public#{@attachment.file.url}", 'audio/mpeg') #sets the media to the file uploaded

  metadata = {
      'title' => "'#{@select.id}'",
      'description' => 'Picture'
  }
  upload = client.execute(:api_method => drive.files.insert, #uploads selected file
                 :parameters => { 'uploadType' => 'multipart' },
                 :body_object => metadata,
                 :media => media)
  @attachment.google_url = upload.data.selfLink
  @attachment.save

  file_id = @select.resource_id

  result = client.execute( #gets the user's lesson from google docs
      :api_method => drive.files.get,
      :parameters => { 'fileId' => file_id })
      file = result.data
      result = client.execute(:uri => file['exportLinks']['text/html'])


  out_file = File.new("public/#{@select.id}.txt", "w") #creates a file with the user's google doc info
  out_file.puts("#{result.body}" + "#{@attachment.google_url}")
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
  File.delete('public#{@attachment.file.url}')

end
end
end
end
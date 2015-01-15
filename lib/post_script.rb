require 'google/api_client'
require 'google/api_client/auth/installed_app'
require 'nokogiri'

SERVICE_ACCOUNT_EMAIL = '897576187605-3sv0ecr29m4clj9uampliu93dn5ea1qe@developer.gserviceaccount.com'

## Path to the Service Account's Private Key file #
SERVICE_ACCOUNT_PKCS12_FILE_PATH = 'public/images/My Project-b7d0c9c1daf3.p12'

module Post
  class Script

    def initialize(var)
      @select = var
    end

    def post
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


      media = Google::APIClient::UploadIO.new("public/#{@select.id}.gs", 'application/vnd.google-apps.script') #sets the media to the file uploaded

      metadata = {
      'title' => "'#{@select.id}'",
      'description' => 'Picture'
      }
      upload = client.execute(:api_method => drive.files.insert, #uploads selected file
        :parameters => { 'uploadType' => 'multipart', 'convert' => 'true' },
        :body_object => metadata,
        :media => media)
    end
  end
attr_reader :var

end
require 'google/api_client'
require 'google/api_client/client_secrets'
require 'google/api_client/auth/installed_app'
require 'nokogiri'
require 'launchy'

SERVICE_ACCOUNT_EMAIL = '897576187605-3sv0ecr29m4clj9uampliu93dn5ea1qe@developer.gserviceaccount.com'

## Path to the Service Account's Private Key file #
SERVICE_ACCOUNT_PKCS12_FILE_PATH = 'public/images/My Project-b7d0c9c1daf3.p12'

CLIENT_ID = '897576187605-urqm54617andd5pqsg9uhi8k9ulqoams.apps.googleusercontent.com'
CLIENT_SECRET = 'bPJqzy3laEzrOevr-f6LGOik'
OATH_SCOPE = 'https://www.googleapis.com/auth/drive'
OATH_SCOPE3 = 'https://www.googleapis.com/auth/drive.file'
REDIRECT_URI = 'urn:ietf:wg:oauth:2.0:oob'

module Post
  class Script

    def initialize(var)
      @select = var
      @gform = GoogleForm.new
      @gform.select_id = @select.id
      @gform.save
  
    end


    def post
client = Google::APIClient.new(
 :application_name => 'Example Ruby application',
  :application_version => '1.0.0'
)

plus = client.discovered_api('plus')

flow = Google::APIClient::InstalledAppFlow.new(
  :client_id => CLIENT_ID,
  :client_secret => CLIENT_SECRET,
 :scope => OATH_SCOPE
)
client.authorization = flow.authorize

result = client.execute(
  :api_method => plus.activities.list,
  :parameters => {'collection' => 'public', 'userId' => 'me'}
)

drive = client.discovered_api('drive', 'v2')


      form = client.execute(:api_method => drive.files.list,
               :parameters => { q: 'mimeType = "application/vnd.google-apps.form", title = "1a2b"' }
               )

      puts "#{form.data}"
      @gform.resource_id = form.data.items[0].id

      sheet = client.execute(:api_method => drive.files.list,
               :parameters => { q: 'mimeType = "application/vnd.google-apps.spreadsheet", title ="1a2b"' }
               )

      @gform.spreadsheet_id = form.data.items[0].id





    end
  end
attr_reader :var
end
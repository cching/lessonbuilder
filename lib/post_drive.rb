require 'google/api_client'
require 'google/api_client/auth/installed_app'
require 'nokogiri'

SERVICE_ACCOUNT_EMAIL = '897576187605-3sv0ecr29m4clj9uampliu93dn5ea1qe@developer.gserviceaccount.com'

## Path to the Service Account's Private Key file #
SERVICE_ACCOUNT_PKCS12_FILE_PATH = 'public/images/My Project-b7d0c9c1daf3.p12'

module Post
class Mass

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
    result = client.execute(:uri => file['exportLinks']['text/html'])

questions = @select.select_questions.sort_by{ |squestion| squestion.xquestion.position }.map! { |question| "#{question.xquestion.standard_id }: #{question.xquestion.content}"  }.join(" </td><td></td></tr><tr><td>")

out_file = File.new("public/#{@select.id}.html", "w")
out_file.puts("#{result.body}" +  "<br />" + "<font color='#63B8FF' size='4'>Questions</font>" + "<table cellpadding='10'><tr><td>" + questions + "</td><td></td></tr></table>")
out_file.close

 media = Google::APIClient::UploadIO.new("public/#{@select.id}.html", 'text/html')
    result = client.execute(
      :api_method => drive.files.update,
      :body_object => file,
      :media => media,
      :parameters => { 'fileId' => file_id,
                       'uploadType' => 'multipart',
                       'convert' => 'true',
                       'alt' => 'json' })
end

def post_vocab
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
    result = client.execute(:uri => file['exportLinks']['text/html'])

vocabs = @select.select_vocabs.map! { |vocab| "#{vocab.xvocab.standard_id }: #{vocab.xvocab.content_english}" }.join(" </td><td></td></tr><tr><td>")

out_file = File.new("public/#{@select.id}.txt", "w")
out_file.puts("#{result.body}" + "<br />" + "<font color='#63B8FF' size='4'>Vocabulary</font>" + "<table cellpadding='10'><tr><td>" + vocabs + "</td><td></td></tr></table>")
out_file.close

 media = Google::APIClient::UploadIO.new("public/#{@select.id}.txt", 'text/html')
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

def post_skill
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
    result = client.execute(:uri => file['exportLinks']['text/html'])

skills = @select.select_skills.map! { |skill| "#{skill.xskill.standard_id }: #{skill.xskill.content}" }.join(" <br /> ")

out_file = File.new("public/#{@select.id}.txt", "w")
out_file.puts("#{result.body}" + "<br />" + "<h2>Skills</h2>" + skills)
out_file.close

 media = Google::APIClient::UploadIO.new("public/#{@select.id}.txt", 'text/html')
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

def post_aquestion
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
    result = client.execute(:uri => file['exportLinks']['text/html'])

aquestions = @select.select_aquestions.map! { |aquestion| "#{aquestion.xaquestion.standard_id }: #{aquestion.xaquestion.content}" }.join(" <br /> ")

out_file = File.new("public/#{@select.id}.txt", "w")
out_file.puts("#{result.body}" + "<br />" + "<font color='#63B8FF' size='4'>Assessment Questions</font>" + aquestions)
out_file.close

 media = Google::APIClient::UploadIO.new("public/#{@select.id}.txt", 'text/html')
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

def post_link
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
    result = client.execute(:uri => file['exportLinks']['text/html'])

links = @select.select_links.map! { |link| "<a href='#{link.xlink.link}'> #{link.xlink.standard_id }: #{link.xlink.comment}</a>" }.join(" <br /> ")

out_file = File.new("public/#{@select.id}.txt", "w")
out_file.puts("#{result.body}" + "<br />" + "<font color='#63B8FF' size='4'>Links</font>" + links)
out_file.close

 media = Google::APIClient::UploadIO.new("public/#{@select.id}.txt", 'text/html')
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

end

class Individual

def initialize(var, var2)
  @select = var
  @resource = var2
end



def post_individual
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
    result = client.execute(:uri => file['exportLinks']['text/html'])


out_file = File.new("public/#{@select.id}.txt", "w")
out_file.puts("#{result.body}" + "<br />" + "#{@resource.standard_id}: " + @resource.content)
out_file.close

 media = Google::APIClient::UploadIO.new("public/#{@select.id}.txt", 'text/html')
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

def post_individual_link
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
    result = client.execute(:uri => file['exportLinks']['text/html'])


out_file = File.new("public/#{@select.id}.txt", "w")
out_file.puts("#{result.body}" + "<br />" + "<a href='#{@resource.link}'> #{@resource.standard_id }: #{@resource.comment}</a>")
out_file.close

 media = Google::APIClient::UploadIO.new("public/#{@select.id}.txt", 'text/html')
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

def post_individual_vocab
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
    result = client.execute(:uri => file['exportLinks']['text/html'])


out_file = File.new("public/#{@select.id}.txt", "w")
out_file.puts("#{result.body}" + "<br />" + "#{@resource.standard_id}: " + @resource.content_english)
out_file.close

 media = Google::APIClient::UploadIO.new("public/#{@select.id}.txt", 'text/html')
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
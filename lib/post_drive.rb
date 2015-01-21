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

questions = @select.select_questions.sort_by{ |squestion| squestion.xquestion.position }.map! { |question| "#{question.xquestion.content}"  }.join(" </td><td></td></tr><tr><td>")

f = "#{result.body}" #define the result of the request as the body of the nokogiri HTML
doc = Nokogiri::HTML(f)

doc.search('//table/tbody/tr/td/p/span').each do |header|
  if header.content == "Questions"
    header.parent.parent.parent.parent.parent['class']= "new_class"
  end
end

if doc.search('//table[@class = "new_class"]').any?
  doc.search('//table[@class = "new_class"]').each do |table|
    table.inner_html = "<thead><tr><th colspan='2'><font color='#63B8FF' size='4'>Questions</font></th></tr></thead> <tbody><tr><td>" + questions + "</td><td></td></tr></tbody>"
    table['cellpadding']="10"
  end
else
  append = "<body><br /><hr style=\"page-break-before:always;\"><br />" + "<table cellpadding='10'><thead><tr><th colspan='2'><font color='#63B8FF' size='4'>Questions</font></th></tr></thead> <tbody><tr><td>" + questions + "</td><td></td></tr></tbody></table></body>"
  doc.at('body').add_next_sibling("#{append}")
end

out_file = File.new("public/#{@select.id}.html", "w")
out_file.puts("#{doc}")
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

vocabs = @select.select_vocabs.sort_by{ |svocab| svocab.xvocab.position }.map! { |vocab| "#{vocab.xvocab.content_english}"  }.join(" </td><td></td></tr><tr><td>")

f = "#{result.body}" #define the result of the request as the body of the nokogiri HTML
doc = Nokogiri::HTML(f)

doc.search('//table/tbody/tr/td/p/span').each do |header|
  if header.content == "Vocabulary"
    header.parent.parent.parent.parent.parent['class']= "new_class_vocab"
  end
end

if doc.search('//table[@class = "new_class_vocab"]').any?
  doc.search('//table[@class = "new_class_vocab"]').each do |table|
    table.inner_html = "<thead><tr><th colspan='2'><font color='#63B8FF' size='4'>Vocabulary</font></th></tr></thead> <tbody><tr><td>" + vocabs + "</td><td></td></tr></tbody>"
    table['cellpadding']="10"
  end
else
  append = "<body><br /><hr style=\"page-break-before:always;display:none;\"><br />" + "<table cellpadding='10'><thead><tr><th colspan='2'><font color='#63B8FF' size='4'>Vocabulary</font></th></tr></thead> <tbody><tr><td>" + vocabs + "</td><td></td></tr></tbody></table></body>"
  doc.at('body').add_next_sibling("#{append}")
end

out_file = File.new("public/#{@select.id}.html", "w")
out_file.puts("#{doc}")
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

aquestions = @select.select_aquestions.sort_by{ |saquestion| saquestion.xaquestion.position }.map! { |aquestion| "<table cellpadding='10'><tr><td>Prompt</td><td></td></tr><tr><td>Question</td><td>#{aquestion.xaquestion.content}</td></tr><tr><td>Student Response</td><td></td></tr>"  }.join("</table>")

f = "#{result.body}" #define the result of the request as the body of the nokogiri HTML
doc = Nokogiri::HTML(f)

doc.search('//table/tbody/tr/td/p/span').each do |header|
  if header.content == "SBAC Assessment"
    header.parent.parent.parent.parent.parent['class']= "new_class_aquestion"
  end
end

if doc.search('//table[@class = "new_class_aquestion"]').any?
  doc.search('//table[@class = "new_class_aquestion"]').each do |table|
    table.inner_html = "<thead><tr><th colspan='2'><font color='#63B8FF' size='4'>SBAC Assessment</font></th></tr></thead> <tbody><tr><td>" + aquestions + "</table></td></tr></tbody>"
    table['cellpadding']="10"
  end
else
  append = "<body><br /><hr style=\"page-break-before:always;display:none;\"><br />" + "<table cellpadding='10'><thead><tr><th colspan='2'><font color='#63B8FF' size='4'>SBAC Assessment</font></th></tr></thead> <tbody><tr><td>" + aquestions + "</table></td></tr></tbody></table></body>"
  doc.at('body').add_next_sibling("#{append}")
end

out_file = File.new("public/#{@select.id}.html", "w")
out_file.puts("#{doc}")
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

links = @select.select_links.sort_by{ |slink| slink.xlink.position }.map! { |link| "#{link.xlink.comment}</td><td><a href='#{link.xlink.link}'>#{link.xlink.link}</a>"  }.join(" </td></tr><tr><td>")

f = "#{result.body}" #define the result of the request as the body of the nokogiri HTML
doc = Nokogiri::HTML(f)

doc.search('//table/tbody/tr/td/p/span').each do |header|
  if header.content == "Links"
    header.parent.parent.parent.parent.parent['class']= "new_class_links"
  end
end

if doc.search('//table[@class = "new_class_links"]').any?
  doc.search('//table[@class = "new_class_links"]').each do |table|
    table.inner_html = "<thead><tr><th colspan='2'><font color='#63B8FF' size='4'>Links</font></th></tr></thead> <tbody><tr><td>" + links + "</td></tr></tbody>"
    table['cellpadding']="10"
  end
else
  append = "<body><br /><hr style=\"page-break-before:always;display:none;\"><br />" + "<table cellpadding='10'><thead><tr><th colspan='2'><font color='#63B8FF' size='4'>Links</font></th></tr></thead> <tbody><tr><td>" + links + "</td></tr></tbody></table></body>"
  doc.at('body').add_next_sibling("#{append}")
end

out_file = File.new("public/#{@select.id}.html", "w")
out_file.puts("#{doc}")
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

File.delete(out_file)

end

end


attr_reader :var

end
desc "Remove empty lessons older than 2 days"
task :remove_blank_lessons => :environment do
 	Select.where(:name => nil).delete_all ["created_at < ?", 1.day.ago] 
end
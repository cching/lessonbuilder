json.array!(@users) do |user|
  json.extract! user, :id, :name, :email
  json.start user.created_at
  json.end user.created_at
  json.url user_url(user, format: :html)
end
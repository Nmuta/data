json.array!(@users) do |user|
  json.extract! user, :id, :username, :email, :campus_id, :first_name, :last_name_string
  json.url user_url(user, format: :json)
end

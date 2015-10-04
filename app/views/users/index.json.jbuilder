json.array!(@users) do |user|
  json.extract! user, :id, :email_id, :is_active, :team_name, :full_name, :password
  json.url user_url(user, format: :json)
end

json.array!(@message_recipient_users) do |message_recipient_user|
  json.extract! message_recipient_user, :id, :user_id, :message_id
  json.url message_recipient_user_url(message_recipient_user, format: :json)
end

json.array!(@message_recipient_channels) do |message_recipient_channel|
  json.extract! message_recipient_channel, :id, :message_id, :channel_id
  json.url message_recipient_channel_url(message_recipient_channel, format: :json)
end

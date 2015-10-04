json.array!(@user_to_channel_subscriptions) do |user_to_channel_subscription|
  json.extract! user_to_channel_subscription, :id, :channel_id, :user_id
  json.url user_to_channel_subscription_url(user_to_channel_subscription, format: :json)
end

class Channel < ActiveRecord::Base

	#a channel can have many users subscribed to it
	has_many :users, through: :user_to_channel_subscriptions, dependent: :destroy
	
	#validates channel name to be present and length be minimum 1 to maximum 20 characters
	validates :channel_name, presence: true, length: { minimum: 1,  maximum: 20 }
	
end
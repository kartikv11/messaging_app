class Channel < ActiveRecord::Base

	#a channel can have many users subscribed to it

	has_many :user_to_channel_subscriptions, dependent: :destroy

	has_many :message_recipient_channels, dependent: :destroy

	has_many :messages, through: :message_recipient_channels, dependent: :destroy

	has_many :user_to_channel_subscriptions, :foreign_key => 'channel_id'
	
	has_many :users, through: :user_to_channel_subscriptions, dependent: :destroy
	
	#validates channel name to be present and length be minimum 1 to maximum 20 characters
	validates :channel_name, presence: true, length: { minimum: 1,  maximum: 20 }
	
	def self.exists?(channel_id)
      Channel.find_by(channel_id: channel_id)
    end

    def is_private(channel)
      Channel.is_private
    end
end
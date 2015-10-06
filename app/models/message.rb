class Message < ActiveRecord::Base

  #a message belongs to a user	
  belongs_to :user

  belongs_to :channel

  #a message can be sent to multiple channels at once
  has_many :message_recipient_channels, dependent: :destroy

  #a message can be sent to multiple users at once
  has_many :message_recipient_users, dependent: :destroy

  validates :message_recipient_users, presence: true, unless: ->(message){message.message_recipient_channels.present?} 

  validates :message_recipient_channels, presence: true, unless: ->(message){message.message_recipient_users.present?}

  #validates presence of user
  validates :user, presence: true

  #validates
  validates :content, length: {minimum: 1, maximum: 320}
  
end
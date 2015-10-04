class Message < ActiveRecord::Base

  #a message belongs to a user	
  belongs_to :user

  #a message can be sent to multiple channels at once
  has_many :message_recipient_channels, dependent: :destroy

  #a message can be sent to multiple users at once
  has_many :message_recipient_users, dependent: :destroy

  #validates presence of user
  validates :user, presence: true

  #validates
  validates :content, length: {minimum: 1, maximum: 320}
  
end

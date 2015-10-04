class User < ActiveRecord::Base
	
	#user can have many messages 
	has_many :messages, dependent: :destroy

	#user can have many channels subscribed
	has_many :channels, through: :user_to_channel_subscriptions, dependent: :destroy

	#validates full name is present and has maximum 30 characters
	validates :full_name, presence: true, length: { maximum: 30 }

	#validates team name is present and has maximum length of 20 characters
	validates :team_name, presence: true, length: { maximum: 20 }

	#define regex to check for a valid email id
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i

	#validates email id is present as per the regex VALID_EMAIL_REGEX and is case-insensitive
	validates :email_id, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	
	#validates password having minimum 6 characters and maximum 20 characters
	validates :password, length: { minimum: 6, maximum: 20 }

	#Converts the Email id to downcase before saving
	before_save { self.email_id = email_id.downcase }

end

class User < ActiveRecord::Base
	
	#user can have many messages 
	has_many :messages, dependent: :destroy

  has_many :message_recipient_users, dependent: :destroy

  has_many :user_to_channel_subscriptions, :foreign_key => 'user_id'

  has_many :channels, through: :user_to_channel_subscriptions, dependent: :destroy

	#validates full name is present and has maximum 30 characters
	validates :full_name, presence: true, length: { maximum: 30 }

	#validates team name is present and has maximum length of 20 characters
	validates :team_name, presence: true, length: { maximum: 20 }


	#define regex to check for a valid email id
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i

	#validates email id is present as per the regex VALID_EMAIL_REGEX and is case-insensitive
	validates :email_id, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
	
	#validates password having minimum 6 characters and maximum 20 characters
	validates :password, length: { minimum: 6, maximum: 20 }

	#Converts the Email id to downcase before saving
	before_save { self.email_id = email_id.downcase }

	  def self.exists?(id)
      User.find_by_id(id: id)
    end
    
    def self.find_by_email_id(email_id)
      User.find_by(email_id: email_id)
    end

    def save_user
      self.save!
    end

    def change_user_state_to_active
      if self.is_active?
        self.is_active!
      end
    end

    def change_user_state_to_inactive
      if ( self.is_active==false )
      	self.is_active = true
      end
    end
end

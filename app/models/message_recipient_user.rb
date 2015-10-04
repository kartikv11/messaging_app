class MessageRecipientUser < ActiveRecord::Base
  
  #is part of user
  belongs_to :user

  #is a part of message
  belongs_to :message

  #validates presence of a user
  validates :user, presence: true

  #validates presence of a message
  validates :message, presence: true
end

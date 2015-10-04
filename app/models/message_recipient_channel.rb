class MessageRecipientChannel < ActiveRecord::Base

  #is part of message
  belongs_to :message

  #is a part of channel
  belongs_to :channel

  #validates presence of the recipient channel
  validates :channel, presence: true

  #validates presence of a message
  validates :message, presence: true
end

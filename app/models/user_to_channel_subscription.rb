class UserToChannelSubscription < ActiveRecord::Base

  #belongs to a channel
  belongs_to :channel

  #belongs to a user
  belongs_to :user

  #validates presence of user
  validates :channel, presence: true

  #validates presence of user
  validates :user, presence: true
end

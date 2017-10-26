require 'rails_helper'

RSpec.describe UserToChannelSubscription, type: :model do
  
  it "is a valid subscription" do
    userInstance = FactoryGirl.create(:validUser)
    channelInstance = FactoryGirl.create(:channelWithCorrectName)
    expect(FactoryGirl.build(:user_to_channel_subscription, user: userInstance, channel: channelInstance)).to be_valid 
  end 

  it "is an invalid subscription" do
	userInstance = FactoryGirl.create(:validUser)
    expect(FactoryGirl.build(:user_to_channel_subscription, user: userInstance, channel: nil)).to_not be_valid 
  end
end

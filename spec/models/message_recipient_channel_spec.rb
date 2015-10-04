require 'rails_helper'

RSpec.describe MessageRecipientChannel, type: :model do
	
  it "has a valid Channel receiving a valid Message" do

    senderUserInstance = FactoryGirl.create(:validUser)
    receivingChannelInstance = FactoryGirl.create(:channelWithCorrectName)
    messageInstance = FactoryGirl.create(:validMessage, user: senderUserInstance)
    expect(FactoryGirl.build(:message_recipient_channel, message: messageInstance, channel: receivingChannelInstance)).to be_valid 
  end 

  it "has an invalid Channel receiving Message" do

    senderUserInstance = FactoryGirl.build(:validUser)
    messageInstance = FactoryGirl.build(:validMessage, user: senderUserInstance)
    expect(FactoryGirl.build(:message_recipient_channel, message: messageInstance, channel: nil)).to_not be_valid
  end
end

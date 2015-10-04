require 'rails_helper'

RSpec.describe MessageRecipientUser, type: :model do
  
  it "has a valid User receiving a valid Message" do

    senderUserInstance = FactoryGirl.create(:validUser)
    receivingUserInstance = FactoryGirl.create(:validUser, email_id: "abc@test.com")
    messageInstance = FactoryGirl.create(:validMessage, user: senderUserInstance)
    expect(FactoryGirl.build(:message_recipient_user, message: messageInstance, user: receivingUserInstance)).to be_valid 
  end 

  it "has an invalid User receiving Message" do

    senderUserInstance = FactoryGirl.build(:validUser)
    messageInstance = FactoryGirl.build(:validMessage, user: senderUserInstance)
    expect(FactoryGirl.build(:message_recipient_user, message: messageInstance, user: nil)).to_not be_valid
  end

end

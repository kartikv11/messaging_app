require 'rails_helper'

RSpec.describe Message, type: :model do
  
  it "is invalid as User is not present" do
    expect(FactoryGirl.build(:validMessage, :user => nil)).to_not be_valid
  end 

  it "is valid as User is present" do

    userInstance = FactoryGirl.build(:validUser)
    expect(FactoryGirl.build(:validMessage, user: userInstance)).to be_valid
  end
  
  it "size should be atleast one character" do

  	userInstance = FactoryGirl.build(:validUser)
    expect(FactoryGirl.build(:invalidMessage, user: userInstance)).to_not be_valid
  end

end

require 'rails_helper'

RSpec.describe Channel, type: :model do

  it "Name is not valid" do
    expect(FactoryGirl.build(:channelWithWrongName)).to_not be_valid
  end

  it "Name is valid" do
  	expect(FactoryGirl.build(:channelWithCorrectName)).to be_valid
  end
  
end

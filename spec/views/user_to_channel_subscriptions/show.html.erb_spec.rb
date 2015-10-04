require 'rails_helper'

RSpec.describe "user_to_channel_subscriptions/show", type: :view do
  before(:each) do
    @user_to_channel_subscription = assign(:user_to_channel_subscription, UserToChannelSubscription.create!(
      :channel => nil,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end

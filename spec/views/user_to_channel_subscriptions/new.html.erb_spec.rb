require 'rails_helper'

RSpec.describe "user_to_channel_subscriptions/new", type: :view do
  before(:each) do
    assign(:user_to_channel_subscription, UserToChannelSubscription.new(
      :channel => nil,
      :user => nil
    ))
  end

  it "renders new user_to_channel_subscription form" do
    render

    assert_select "form[action=?][method=?]", user_to_channel_subscriptions_path, "post" do

      assert_select "input#user_to_channel_subscription_channel_id[name=?]", "user_to_channel_subscription[channel_id]"

      assert_select "input#user_to_channel_subscription_user_id[name=?]", "user_to_channel_subscription[user_id]"
    end
  end
end

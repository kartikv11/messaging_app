require 'rails_helper'

RSpec.describe "user_to_channel_subscriptions/edit", type: :view do
  before(:each) do
    @user_to_channel_subscription = assign(:user_to_channel_subscription, UserToChannelSubscription.create!(
      :channel => nil,
      :user => nil
    ))
  end

  it "renders the edit user_to_channel_subscription form" do
    render

    assert_select "form[action=?][method=?]", user_to_channel_subscription_path(@user_to_channel_subscription), "post" do

      assert_select "input#user_to_channel_subscription_channel_id[name=?]", "user_to_channel_subscription[channel_id]"

      assert_select "input#user_to_channel_subscription_user_id[name=?]", "user_to_channel_subscription[user_id]"
    end
  end
end

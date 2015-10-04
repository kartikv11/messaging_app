require 'rails_helper'

RSpec.describe "user_to_channel_subscriptions/index", type: :view do
  before(:each) do
    assign(:user_to_channel_subscriptions, [
      UserToChannelSubscription.create!(
        :channel => nil,
        :user => nil
      ),
      UserToChannelSubscription.create!(
        :channel => nil,
        :user => nil
      )
    ])
  end

  it "renders a list of user_to_channel_subscriptions" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

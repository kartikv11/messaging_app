require 'rails_helper'

RSpec.describe "message_recipient_users/index", type: :view do
  before(:each) do
    assign(:message_recipient_users, [
      MessageRecipientUser.create!(
        :user => nil,
        :message => nil
      ),
      MessageRecipientUser.create!(
        :user => nil,
        :message => nil
      )
    ])
  end

  it "renders a list of message_recipient_users" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

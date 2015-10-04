require 'rails_helper'

RSpec.describe "message_recipient_users/new", type: :view do
  before(:each) do
    assign(:message_recipient_user, MessageRecipientUser.new(
      :user => nil,
      :message => nil
    ))
  end

  it "renders new message_recipient_user form" do
    render

    assert_select "form[action=?][method=?]", message_recipient_users_path, "post" do

      assert_select "input#message_recipient_user_user_id[name=?]", "message_recipient_user[user_id]"

      assert_select "input#message_recipient_user_message_id[name=?]", "message_recipient_user[message_id]"
    end
  end
end

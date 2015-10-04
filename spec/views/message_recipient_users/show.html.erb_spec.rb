require 'rails_helper'

RSpec.describe "message_recipient_users/show", type: :view do
  before(:each) do
    @message_recipient_user = assign(:message_recipient_user, MessageRecipientUser.create!(
      :user => nil,
      :message => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end

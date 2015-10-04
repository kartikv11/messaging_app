require 'rails_helper'

RSpec.describe "message_recipient_channels/show", type: :view do
  before(:each) do
    @message_recipient_channel = assign(:message_recipient_channel, MessageRecipientChannel.create!(
      :message => nil,
      :channel => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end

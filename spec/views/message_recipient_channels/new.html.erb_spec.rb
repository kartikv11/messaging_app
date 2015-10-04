require 'rails_helper'

RSpec.describe "message_recipient_channels/new", type: :view do
  before(:each) do
    assign(:message_recipient_channel, MessageRecipientChannel.new(
      :message => nil,
      :channel => nil
    ))
  end

  it "renders new message_recipient_channel form" do
    render

    assert_select "form[action=?][method=?]", message_recipient_channels_path, "post" do

      assert_select "input#message_recipient_channel_message_id[name=?]", "message_recipient_channel[message_id]"

      assert_select "input#message_recipient_channel_channel_id[name=?]", "message_recipient_channel[channel_id]"
    end
  end
end

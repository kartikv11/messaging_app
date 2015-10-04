require 'rails_helper'

RSpec.describe "message_recipient_channels/index", type: :view do
  before(:each) do
    assign(:message_recipient_channels, [
      MessageRecipientChannel.create!(
        :message => nil,
        :channel => nil
      ),
      MessageRecipientChannel.create!(
        :message => nil,
        :channel => nil
      )
    ])
  end

  it "renders a list of message_recipient_channels" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

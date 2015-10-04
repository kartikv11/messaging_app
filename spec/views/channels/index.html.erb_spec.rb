require 'rails_helper'

RSpec.describe "channels/index", type: :view do
  before(:each) do
    assign(:channels, [
      Channel.create!(
        :channel_name => "Channel Name"
      ),
      Channel.create!(
        :channel_name => "Channel Name"
      )
    ])
  end

  it "renders a list of channels" do
    render
    assert_select "tr>td", :text => "Channel Name".to_s, :count => 2
  end
end

require 'rails_helper'

RSpec.describe "MessageRecipientChannels", type: :request do
  describe "GET /message_recipient_channels" do
    it "works! (now write some real specs)" do
      get message_recipient_channels_path
      expect(response).to have_http_status(200)
    end
  end
end

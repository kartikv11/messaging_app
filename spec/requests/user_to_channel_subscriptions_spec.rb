require 'rails_helper'

RSpec.describe "UserToChannelSubscriptions", type: :request do
  describe "GET /user_to_channel_subscriptions" do
    it "works! (now write some real specs)" do
      get user_to_channel_subscriptions_path
      expect(response).to have_http_status(200)
    end
  end
end

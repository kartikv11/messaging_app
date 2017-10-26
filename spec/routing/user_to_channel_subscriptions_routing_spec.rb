require "rails_helper"

RSpec.describe UserToChannelSubscriptionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/user_to_channel_subscriptions").to route_to("user_to_channel_subscriptions#index")
    end

    it "routes to #new" do
      expect(:get => "/user_to_channel_subscriptions/new").to route_to("user_to_channel_subscriptions#new")
    end

    it "routes to #show" do
      expect(:get => "/user_to_channel_subscriptions/1").to route_to("user_to_channel_subscriptions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/user_to_channel_subscriptions/1/edit").to route_to("user_to_channel_subscriptions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/user_to_channel_subscriptions").to route_to("user_to_channel_subscriptions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/user_to_channel_subscriptions/1").to route_to("user_to_channel_subscriptions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/user_to_channel_subscriptions/1").to route_to("user_to_channel_subscriptions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/user_to_channel_subscriptions/1").to route_to("user_to_channel_subscriptions#destroy", :id => "1")
    end

  end
end

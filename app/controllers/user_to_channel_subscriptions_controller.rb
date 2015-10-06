class UserToChannelSubscriptionController < ApplicationController
  before_action :set_user_to_channel_subscription, only: [:show, :edit, :update, :destroy]

  # GET /user_to_channel_subscriptions
  # GET /user_to_channel_subscriptions.json
  def index
    @user_to_channel_subscriptions = UserToChannelSubscription.all
  end

  # GET /user_to_channel_subscriptions/1
  # GET /user_to_channel_subscriptions/1.json
  def show
  end

  # GET /user_to_channel_subscriptions/new
  def new
    @user_to_channel_subscription = UserToChannelSubscription.new
  end

  # GET /user_to_channel_subscriptions/1/edit
  def edit
  end

  # POST /user_to_channel_subscriptions
  # POST /user_to_channel_subscriptions.json
  def create
    @user_to_channel_subscription = UserToChannelSubscription.new(user_to_channel_subscription_params)
    @user_to_channel_subscription.save
  end

  # PATCH/PUT /user_to_channel_subscriptions/1
  # PATCH/PUT /user_to_channel_subscriptions/1.json
  def update
    @user_to_channel_subscription.update(user_to_channel_subscription_params)
  end

  # DELETE /user_to_channel_subscriptions/1
  # DELETE /user_to_channel_subscriptions/1.json
  def destroy
    @user_to_channel_subscription.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_to_channel_subscription
      @user_to_channel_subscription = UserToChannelSubscription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_to_channel_subscription_params
      params.require(:user_to_channel_subscription).permit(:channel_id, :user_id)
    end
end

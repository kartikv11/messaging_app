class UserToChannelSubscriptionsController < ApplicationController
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

    respond_to do |format|
      if @user_to_channel_subscription.save
        format.html { redirect_to @user_to_channel_subscription, notice: 'User to channel subscription was successfully created.' }
        format.json { render :show, status: :created, location: @user_to_channel_subscription }
      else
        format.html { render :new }
        format.json { render json: @user_to_channel_subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_to_channel_subscriptions/1
  # PATCH/PUT /user_to_channel_subscriptions/1.json
  def update
    respond_to do |format|
      if @user_to_channel_subscription.update(user_to_channel_subscription_params)
        format.html { redirect_to @user_to_channel_subscription, notice: 'User to channel subscription was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_to_channel_subscription }
      else
        format.html { render :edit }
        format.json { render json: @user_to_channel_subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_to_channel_subscriptions/1
  # DELETE /user_to_channel_subscriptions/1.json
  def destroy
    @user_to_channel_subscription.destroy
    respond_to do |format|
      format.html { redirect_to user_to_channel_subscriptions_url, notice: 'User to channel subscription was successfully destroyed.' }
      format.json { head :no_content }
    end
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

class MessageRecipientUsersController < ApplicationController
  before_action :set_message_recipient_user, only: [:show, :edit, :update, :destroy]

  # GET /message_recipient_users
  # GET /message_recipient_users.json
  def index
    @message_recipient_users = MessageRecipientUser.all
  end

  # GET /message_recipient_users/1
  # GET /message_recipient_users/1.json
  def show
  end



  # GET /message_recipient_users/new
  def new
    @message_recipient_user = MessageRecipientUser.new
  end

  # GET /message_recipient_users/1/edit
  def edit
  end

  # POST /message_recipient_users
  # POST /message_recipient_users.json
  def create
    @message_recipient_user = MessageRecipientUser.new(message_recipient_user_params)
    @message_recipient_user.save
  end

  # PATCH/PUT /message_recipient_users/1
  # PATCH/PUT /message_recipient_users/1.json
  def update
    @message_recipient_user.update(message_recipient_user_params)
  end

  # DELETE /message_recipient_users/1
  # DELETE /message_recipient_users/1.json
  def destroy
    @message_recipient_user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message_recipient_user
      @message_recipient_user = MessageRecipientUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_recipient_user_params
      params.require(:message_recipient_user).permit(:user_id, :message_id)
    end
end

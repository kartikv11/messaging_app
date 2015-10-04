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

    respond_to do |format|
      if @message_recipient_user.save
        format.html { redirect_to @message_recipient_user, notice: 'Message recipient user was successfully created.' }
        format.json { render :show, status: :created, location: @message_recipient_user }
      else
        format.html { render :new }
        format.json { render json: @message_recipient_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /message_recipient_users/1
  # PATCH/PUT /message_recipient_users/1.json
  def update
    respond_to do |format|
      if @message_recipient_user.update(message_recipient_user_params)
        format.html { redirect_to @message_recipient_user, notice: 'Message recipient user was successfully updated.' }
        format.json { render :show, status: :ok, location: @message_recipient_user }
      else
        format.html { render :edit }
        format.json { render json: @message_recipient_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /message_recipient_users/1
  # DELETE /message_recipient_users/1.json
  def destroy
    @message_recipient_user.destroy
    respond_to do |format|
      format.html { redirect_to message_recipient_users_url, notice: 'Message recipient user was successfully destroyed.' }
      format.json { head :no_content }
    end
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

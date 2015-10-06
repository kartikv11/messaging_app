class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  Error = "Does not exist"
  # GET /users
  # GET /users.json
  def index
    users = User.all
    response_data = {
          :payload => {:users => users},
          :meta => {},
          :error => {}
        }
    render json: response_data
  end

  def get_all_channels_for_user
    user = User.find_by_id(params[:user_id])
    channels = []
    if( user )
      user.channels.each do |item|
        channels << {:channel_id => item["id"], :channel_name => item["channel_name"]}
      end
    response_data = {
          :payload => { :channel => channels},
          :meta => {},
          :error => {}
        }
    else
      response_data = {
          :payload => {},
          :meta => {},
          :error => {} 
        }
    end
    render json: response_data
  end

  def get_all_users_for_the_channel
    user = []
    channel = Channel.find_by_id(params[:channel_id])
    if (channel)
      channel.users.each do |item|
        user << {:user_id => item["id"], :full_name => item["full_name"], :email_id => item["email_id"]}
      end
      response_data = {
          :payload => { :users => user},
          :meta => {},
          :error => {}
        }
    else
      response_data = {
          :payload => {},
          :meta => {},
          :error => {} 
        }  
    end 
    render json: response_data
  end

  def get_all_messages_received_by_the_user
    user = User.find_by_id(params[:user_id])
    messages = []
    if (user)
      user.messages.each do |item|
        messages << {:content => item["content"]}
      end
    response_data = {
          :payload => {:messages => messages},
          :meta => {},
          :error => {} 
        }
    
    else
      response_data = {
          :payload => {},
          :meta => {},
          :error => {} 
        }
    end
    render json: response_data
  end

  def set_message_from_user_to_user
    success = "SUCCESS"
    failure = "FAILURE"
    fromUser = User.find_by_id(params[:from_user_id])
    toUser = User.find_by_id(params[:to_user_id])
    if (fromUser && toUser)
      message = Message.new(content: params[:content])
      message.user = fromUser
      to = MessageRecipientUser.new(user: toUser)
      message.message_recipient_users << to
      message.save!
      response_data = {
          :payload => message,
          :meta => {},
          :error => {},
          :status => success
        }
    else
      response_data = {
          :payload => {},
          :meta => {},
          :error => {},
          :status => failure
        }
    end
    render json: response_data
  end

  def set_message_from_user_to_channel
    success = "SUCCESS"
    failure = "FAILURE"
    fromUser = User.find_by_id(params[:from_user_id])
    toChannel = User.find_by_id(params[:to_channel_id])
    if (fromUser && toChannel)
      if(toChannel.is_private?)
      message = Message.new(content: params[:content])
      message.user = fromUser
      to = MessageRecipientChannel.new(channel: toChannel)
      message.message_recipient_channels << to
      message.save!
      response_data = {
          :payload => {},
          :meta => {},
          :error => {},
          :status => success
        }
    else
      response_data = {
          :payload => {},
          :meta => {},
          :error => {},
          :status => failure
        }
    end
    render json: response_data
  end

  # GET /users/1
  # GET /users/1.json
  def show
    user = User.find(params[:id])
  end

  # GET /users/new
  def new
    user = User.new
  end

  # GET /users/1/edit
  def edit
    user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    user = User.new(user_params)
    user.save
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    user.update(user_params)
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email_id, :is_active, :team_name, :full_name, :password)
    end
end

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
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

    # 
    # [register_user API]
    # parameters: full_name,team_name,email_id,password
    # @return [type] [description]  
  def register_user
    success = "SUCCESS"
    failure = "FAILURE"
    if(User.create_user(user_params))
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

  # /GET
  # [get_all_channels_for_user API]
  # parameters: user_id
  # @return [type] [description]
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

  # /GET
  # [get_all_users_for_the_channel API]
  # parameters: channel_id
  # @return [type] [description]
  def get_all_users_for_the_channel
    userInstance = []
    channelInstance = Channel.find_by_id(params[:channel_id])
    if (channelInstance)
      channelInstance.users.each do |item|
        userInstance << {:user_id => item["id"], :full_name => item["full_name"], :email_id => item["email_id"]}
      end
      response_data = {
          :payload => { :users => userInstance},
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

  # /GET
  # [get_all_messages_received_by_the_user APi]
  # parameters: user_id
  # @return [type] [description]
  def get_all_messages_received_by_the_user
    user = User.find_by_id(params[:user_id])
    messages = []
    if (user)
      user.message_recipient_users.each do |item|
        message = Message.find(item[:message_id])
        messages << {:content => message["content"]}
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

  # POST
  # [set_message_from_user_to_user API]
  # parameters: from_user_id, to_user_id, content
  # @return [type] [description]
  def set_message_from_user_to_user
    success = "SUCCESS"
    failure = "FAILURE"
    fromUser = User.find_by_id(params[:from_user_id])
    toUser = User.find_by_id(params[:to_user_id])
    if (fromUser && toUser )
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

  # POST
  # [subscribe_user_to_channel API]
  # parameters: user_id, channel_id
  # @return [type] [description]
  def subscribe_user_to_channel
    success = "SUCCESS"
    failure = "FAILURE"
    userInstance = User.find(params[:user_id])
    channelInstance = Channel.find(params[:channel_id])
      if (userInstance && channelInstance)
        userInstance.channels << channelInstance
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

  # /POST
  # [unsubscribe_user_from_channel API]
  # parameters: user_id, channel_id
  # @return [type] [description]
  def unsubscribe_user_from_channel
    success = "SUCCESS"
    failure = "FAILURE"
    userInstance = User.find(params[:user_id])
    channelInstance = Channel.find(params[:channel_id])
    if (userInstance && channelInstance)
        UserToChannelSubscription.delete_all(user: userInstance,channel: channelInstance)
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

  # /POST
  # [set_message_from_user_to_channel API]
  # parameters: user_id, channel_id, content
  # @return [type] [description]
  def set_message_from_user_to_channel
    success = "SUCCESS"
    failure = "FAILURE"
    isPrivate = "PRIVATE AND NOT SUBSCRIBED"
    notExists = "Does not Exist"
    fromUser = User.find(params[:user_id])
    toChannel = Channel.find(params[:channel_id])
    if (fromUser && toChannel)
      if (toChannel.is_private)
        if(UserToChannelSubscription.find_by(user: fromUser,channel: toChannel))
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
              :status => isPrivate
            }
        end
      else
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
      end
    else
      response_data = {
          :payload => {},
          :meta => {},
          :error => {},
          :status => notExists
        }
    end
    render json: response_data
  end

  # /POST
  # [toggle_user_status API]
  # parameters: user_id
  # @return [type] [description]
  def toggle_user_status
    user = User.find_by_id(params[:user_id])
    render json: user.toggle!(:is_active)
  end

  # /GET
  # [get_user_status API]
  # parameters: user_id
  # @return [type] [description]
  def get_user_status
    success = "SUCCESS"
    user = User.find_by_id(params[:user_id])
    status = []
    status << {:is_active => user["is_active"]}
    response_data = {
          :payload => status,
          :meta => {},
          :error => {}, 
          :status => success
        }  
    render json: response_data
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

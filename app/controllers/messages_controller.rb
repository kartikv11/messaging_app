class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  def get_all_messages_for_the_channel
    channel = Channel.find_by_id(params[:channel_id])
    message = []
    if(channel)
      channel.messages.each do |item|
        message << {:message => item["content"]}
      end
      response_data = {
          :payload => { :message => message},
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

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
  end

  def show_all_messages
    @messages = Message.all
    render json: @messages
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:content, :user_id)
    end


end

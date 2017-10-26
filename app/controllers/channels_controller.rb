class ChannelsController < ApplicationController
  before_action :set_channel, only: [:show, :edit, :update, :destroy]

  # GET /channels
  # GET /channels.json
  def index
    @channels = Channel.all
  end

  # /POST
  # [register_channel API]
  # parameters: channel_name
  # @return [type] [description]
  def register_channel
    success = "success"
    failure = "failure"
      Channel.create_channel(channel_params)
      if(Channel.create_channel(channel_params))
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_channel
      @channel = Channel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def channel_params
      params.require(:channel).permit(:channel_name)
    end
end

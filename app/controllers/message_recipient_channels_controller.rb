class MessageRecipientChannelsController < ApplicationController
  before_action :set_message_recipient_channel, only: [:show, :edit, :update, :destroy]

  # GET /message_recipient_channels
  # GET /message_recipient_channels.json
  def index
    @message_recipient_channels = MessageRecipientChannel.all
  end

  # GET /message_recipient_channels/1
  # GET /message_recipient_channels/1.json
  def show
  end

  # GET /message_recipient_channels/new
  def new
    @message_recipient_channel = MessageRecipientChannel.new
  end

  # GET /message_recipient_channels/1/edit
  def edit
  end

  # POST /message_recipient_channels
  # POST /message_recipient_channels.json
  def create
    @message_recipient_channel = MessageRecipientChannel.new(message_recipient_channel_params)

    respond_to do |format|
      if @message_recipient_channel.save
        format.html { redirect_to @message_recipient_channel, notice: 'Message recipient channel was successfully created.' }
        format.json { render :show, status: :created, location: @message_recipient_channel }
      else
        format.html { render :new }
        format.json { render json: @message_recipient_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /message_recipient_channels/1
  # PATCH/PUT /message_recipient_channels/1.json
  def update
    respond_to do |format|
      if @message_recipient_channel.update(message_recipient_channel_params)
        format.html { redirect_to @message_recipient_channel, notice: 'Message recipient channel was successfully updated.' }
        format.json { render :show, status: :ok, location: @message_recipient_channel }
      else
        format.html { render :edit }
        format.json { render json: @message_recipient_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /message_recipient_channels/1
  # DELETE /message_recipient_channels/1.json
  def destroy
    @message_recipient_channel.destroy
    respond_to do |format|
      format.html { redirect_to message_recipient_channels_url, notice: 'Message recipient channel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message_recipient_channel
      @message_recipient_channel = MessageRecipientChannel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_recipient_channel_params
      params.require(:message_recipient_channel).permit(:message_id, :channel_id)
    end
end

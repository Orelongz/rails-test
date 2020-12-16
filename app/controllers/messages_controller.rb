class MessagesController < ApplicationController
  # before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    # NOTE: IP address changes and is not the ideal way to handle the filter
    # Using the below as no user/permission is available/needed for this app
    @messages = params[:filter].present? ? Message.by_ip_address(request.remote_ip) : Message.all
    @messages = @messages.visible unless is_admin?
    @messages.order!(created_at: :desc)
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)
    @message.ip_address = request.remote_ip

    respond_to do |format|
      if @message.save
        format.html { redirect_to messages_path, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_message
    #   @message = Message.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:name, :entry, :ip_address)
    end
end

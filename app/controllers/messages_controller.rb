class MessagesController < ApplicationController
  # Devise’s authenticate_user! lives in ApplicationController
  # Load & authorize @message (for show/edit/update/destroy)
  # and @messages (for index); for new/create it builds from params.
  load_and_authorize_resource

  # We still need to load chats & users for the select dropdowns
  before_action :load_collections, only: [ :new, :create, :edit, :update ]

  def index
    # @messages is already loaded and authorized
  end

  def show
    # @message is already loaded and authorized
  end

  def new
    # @message = Message.new, built & authorized by CanCanCan
  end

  def create
    if @message.save
      redirect_to @message, notice: "Message sent successfully."
    else
      render :new
    end
  end

  def edit
    # @message is loaded & authorized
  end

  def update
    if @message.update(message_params)
      redirect_to @message, notice: "Message updated successfully."
    else
      render :edit
    end
  end

  private

  def load_collections
    @chats = Chat.all
    @users = User.all
  end

  def message_params
    params.require(:message).permit(:chat_id, :user_id, :body)
  end
end

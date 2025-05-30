class ChatsController < ApplicationController
  load_and_authorize_resource
  before_action :load_users, only: [ :new, :create, :edit, :update ]

  def index
    # @chats loaded & authorized
  end

  def show
    # @chat loaded & authorized
  end

  def new
    # @chat = Chat.new
  end

  def create
    if @chat.save
      redirect_to @chat, notice: "Chat created successfully."
    else
      render :new
    end
  end

  def edit
    # @chat loaded & authorized
  end

  def update
    if @chat.update(chat_params)
      redirect_to @chat, notice: "Chat updated successfully."
    else
      render :edit
    end
  end

  private

  def load_users
    @users = User.all
  end

  def chat_params
    params.require(:chat).permit(:sender_id, :receiver_id)
  end
end

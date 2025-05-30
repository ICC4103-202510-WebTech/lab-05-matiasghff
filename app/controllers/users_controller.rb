class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    # @users loaded & authorized
  end

  def show
    # @user loaded & authorized
  end

  def new
    # @user = User.new
  end

  def create
    if @user.save
      redirect_to @user, notice: "User created successfully."
    else
      render :new
    end
  end

  def edit
    # @user loaded & authorized
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "User updated successfully."
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end

class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You've registred."
      redirect_to root_path
    else
      flash[:danger] = @user.errors.full_messages
      render new_user_path
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])

    if @user.update(user_params)
      flash[:success] = "Details updated."
      redirect_to root_path
    else
      flash[:danger] = @user.errors.full_messages
      redirect_to edit_user_path(@user)
    end
  end

  private

    def user_params
      params.require(:user).permit(:password, :email, :username, :image)
    end

end

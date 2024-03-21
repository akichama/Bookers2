class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
  end

  def show
    @user = current_user
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to :user_path
  end
  
  def user_params
    params.require(:User).permit(:name, :introduction, :profile_image)
  end
end

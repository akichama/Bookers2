class UsersController < ApplicationController
  def index
  end

  def show
    @user =User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to :user
  end
  
  def user_params
    params.require(:User).permit(:name, :introduction, :profile_image)
  end
end

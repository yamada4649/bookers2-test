class UsersController < ApplicationController
    before_action :authenticate_user!, except: [:top]

  def index
    @users = User.all
  end

  def top
  end

  def show
    @users = User.all
    @user = User.find(params[:id])

  end

  def edit
      @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :update
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image_id)
  end

end

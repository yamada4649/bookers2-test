class UsersController < ApplicationController
    before_action :authenticate_user!, except: [:top]
    before_action :correct_user, only:[:edit, :update]

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def top
  end

  def show
    @user = current_user
    @user_detail = User.find(params[:id])
    @book = Book.new
    @books = @user_detail.books.reverse_order
  end

  def edit
      @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated your status successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def correct_user
    editing_user = User.find(params[:id])
    if current_user != editing_user
      redirect_to user_path(current_user.id)
    end
  end

end

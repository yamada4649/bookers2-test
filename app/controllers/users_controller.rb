class UsersController < ApplicationController
    before_action :authenticate_user!, except: [:top]

  def index
    @profile_images = User.all
  end

  def top

  end

  def show
  end

  def edit
    @profile_image = User.new(params[:id])
    if @profile_image.save
      redirect_to user_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :plofile_image_id)
  end

end

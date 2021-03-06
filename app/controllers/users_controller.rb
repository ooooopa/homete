class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render "new"
    end
  end

  def show
    @favorites_achievements = @user.favorite_achievements
  end

  def update
    #@user.image.resize_image(@user)
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      redirect_to user_path(@user.id)
    end
  end

  def edit
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache)
  end
end

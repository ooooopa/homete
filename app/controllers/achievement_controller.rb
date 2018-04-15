class AchievementController < ApplicationController
  before_action :login_check, only: [:new, :edit, :destroy]
  before_action :set_achievement, only: [:edit, :show, :update, :destroy]
  
  def index
  end
  
  def new
    if params[:back]
        @achievement = Achievement.new(achievement_params)
    else
        @achievement = Achievement.new
    end
  end
  
  def create
    @achievement = Achievement.new(achievement_params)
    @achievement.user_id = current_user.id
      if @achievement.save
        redirect_to  list_achievement_index_path
      else
        render "new"
      end
  end
  
  def list
    @achievements = Achievement.order(id: :desc)
  end
  
  def edit
    if @achievement.user_id == current_user.id
      @editFlag = true
    else
      #flash.now[:danger] = '自分のつぶやきのみ編集できます'
      #@achievements = Achievement.order(id: :desc)
      #render "list"
      @editFlag = false
    end
  end
  
  def update
    if @achievement.update(achievement_params)
        redirect_to list_achievement_index_path
    else
        render "edit"
    end    
  end
  
  def destroy
    if @achievement.user_id == current_user.id
      @achievement.destroy
      redirect_to list_achievement_index_path
    else
      flash.now[:danger] = '自分のつぶやきのみ削除できます'
      @achievements = Achievement.order(id: :desc)
      render "list"
    end
  end
  
  def confirm
    @achievement = Achievement.new(achievement_params)
    @achievement.user_id = current_user.id
    render "new" if @achievement.invalid?
  end

  def show
    @favorite = current_user.favorites.find_by(achievement_id: @achievement.id)
  end
  
  private
  def achievement_params
    params.require(:achievement).permit(:content)
  end
  
  def set_achievement
    @achievement = Achievement.find(params[:id])
  end

  def login_check
    if logged_in?
    else
      redirect_to new_session_path
    end
  end
end

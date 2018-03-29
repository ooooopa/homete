class AchievementController < ApplicationController
  before_action :set_achievement, only: [:edit, :update, :destroy]
  
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
      if @achievement.save
        redirect_to  list_achievement_index_path
      else
        render "new"
      end
  end
  
  def list
    #@achievements = Achievement.all
    @achievements = Achievement.order(id: :desc)
  end
  
  def edit
  end
  
  def update
    if @achievement.update(achievement_params)
        redirect_to list_achievement_index_path
    else
        render "edit"
    end    
  end
  
  def destroy
    @achievement.destroy
    redirect_to list_achievement_index_path
  end
  
  def confirm
    @achievement = Achievement.new(achievement_params)
    render "new" if @achievement.invalid?    
  end
  
  private
  def achievement_params
    params.require(:achievement).permit(:content)
  end
  
  def set_achievement
    @achievement = Achievement.find(params[:id])
  end
end

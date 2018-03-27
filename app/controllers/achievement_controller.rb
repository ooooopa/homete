class AchievementController < ApplicationController
  def index
  end
  
  def new
    @achievement = Achievement.new
  end
  
  def create
    @achievement = Achievement.new(achievement_params)
      if @achievement.save
        redirect_to  root_path, notice: "ブログを作成しました！"
      else
        render "new"
      end
  end
  
  def list
    @achievements = Achievement.all
  end
  
  private
  def achievement_params
    params.require(:achievement).permit(:content)
  end
  
end

module AchievementHelper
  def choose_new_or_edit
    if action_name == "new" || action_name == "confirm"
      confirm_achievement_index_path 
    elsif action_name == "edit"
      
    end
  end
end

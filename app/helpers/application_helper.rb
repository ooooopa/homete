module ApplicationHelper
  def choose_new_or_edit
    if action_name == "new" || action_name == "confirm"
      confirm_achievement_index_path 
    elsif action_name == "edit"
      achievement_path
    end
  end
end

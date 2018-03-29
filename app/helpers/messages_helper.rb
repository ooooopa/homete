module MessagesHelper
  def choose_new_or_edit2
    if action_name == "new" || action_name == "confirm"
      confirm_message_index_path
    elsif action_name == "edit"
      
    end
  end
end

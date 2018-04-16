class RemoveAchievementIdFromFavorites < ActiveRecord::Migration[5.1]
  def change
    remove_column :favorites, :achievement_id, :string
  end
end

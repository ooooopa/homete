class AddAchievementIdToFavorites < ActiveRecord::Migration[5.1]
  def change
    add_column :favorites, :achievement_id, :integer
  end
end

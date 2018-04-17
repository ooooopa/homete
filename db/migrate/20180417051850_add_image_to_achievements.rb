class AddImageToAchievements < ActiveRecord::Migration[5.1]
  def change
    add_column :achievements, :image, :text
  end
end

class CreateAchievement < ActiveRecord::Migration[5.1]
  def change
    create_table :achievements do |t|
      t.string :content
    end
  end
end

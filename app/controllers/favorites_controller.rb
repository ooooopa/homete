class FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.create(achievement_id: params[:achievement_id])
    redirect_to list_achievement_index_path, notice: "#{favorite.achievement.user.name}さんのつぶやきをお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(achievement_id: params[:achievement_id]).destroy
    redirect_to list_achievement_index_path, notice: "#{favorite.achievement.user.name}さんのつぶやきをお気に入り解除しました"
  end
end

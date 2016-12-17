class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def fav
    fav = Favorite.new
    fav.user_id = current_user.id
    fav.recipe_id = params[:id]
    fav.save
  end

  def index
    @favs = Favorite.where(user_id: current_user.id)
  end
end

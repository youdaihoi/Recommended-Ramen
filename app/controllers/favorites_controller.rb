# frozen_string_literal: true

class FavoritesController < ApplicationController
  def create
    @ramen = Ramen.find(params[:ramen_id])
    @favorite = current_user.favorites.new(ramen_id: @ramen.id)
    @favorite.save
  end

  def destroy
    @ramen = Ramen.find(params[:ramen_id])
    @favorite = current_user.favorites.find_by(ramen_id: @ramen.id)
    @favorite.destroy
  end
end

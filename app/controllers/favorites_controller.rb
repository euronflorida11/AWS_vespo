class FavoritesController < ApplicationController
  def create
    @team = Team.find(params[:team_id])
    favorite = current_user.favorites.new(team_id: @team.id)
    favorite.save
    # redirect_to request.referer
  end

  def destroy
    @team = Team.find(params[:team_id])
    favorite = current_user.favorites.find_by(team_id: @team.id)
    favorite.destroy
    # redirect_to request.referer
  end
end

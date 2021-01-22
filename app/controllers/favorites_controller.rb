class FavoritesController < ApplicationController

  def create
    team = Team.find(params[:team_id])
    favorite = current_user.favorites.new(team_id: team.id)
    favorite.save
    redirect_to team_path(team)
  end

  def destroy
    team = Team.find(params[:team_id])
    favorite = current_user.favorites.find_by(team_id: team.id)
    favorite.destroy
    redirect_to team_path(team)
  end
end

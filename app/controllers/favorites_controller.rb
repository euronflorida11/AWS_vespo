class FavoritesController < ApplicationController

  def create
    sport = Sport.find(params[:sport_id])
    favorite = current_user.favorites.new(sport_id: sport.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    sport = Sport.find(params[:sport_id])
    favorite = current_user.favorites.find_by(sport_id: sport.id)
    favorite.destroy
    redirect_to request.referer
  end

  def create
    team = Team.find(params[:team_id])
    favorite = current_user.favorites.new(team_id: team.id)
    favorite.save
    redirect_to request.referer
  end
  
  def destroy
    team = Team.find(params[:team_id])
    favorite = current_user.favorites.find_by(team_id: team.id)
    favorite.destroy
    redirect_to request.referer
  end
end
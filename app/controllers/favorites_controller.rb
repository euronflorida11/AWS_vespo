class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @team = Team.find(params[:team_id])
    favorite = current_user.favorites.new(team_id: @team.id)
    if favorite.save
      @team.create_notification_favorite!(current_user)
    end
  end

  def destroy
    @team = Team.find(params[:team_id])
    favorite = current_user.favorites.find_by(team_id: @team.id)
    favorite.destroy
  end
end

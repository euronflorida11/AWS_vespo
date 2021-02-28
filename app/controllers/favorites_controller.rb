class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    # if @team.user_id != current_user.id
      @team = Team.find(params[:team_id])
      favorite = current_user.favorites.new(team_id: @team.id)
      favorite.save
      @team.create_notification_by(current_user)
      # redirect_to request.referer
    # end
  end

  def destroy
    @team = Team.find(params[:team_id])
    favorite = current_user.favorites.find_by(team_id: @team.id)
    favorite.destroy
    # redirect_to request.referer
  end
end

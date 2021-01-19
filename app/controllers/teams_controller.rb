class TeamsController < ApplicationController
  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team.user_id = current_user.id
    @team.save
    redirect_to teams_path
  end

  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def destroy
  end

  private
  def team_params
    params.require(:team).permit(:name, :introduction, :number, :address, :status, :image)
  end

end

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
    @comment = Comment.new
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = current_team
    if @team.update(team_params)
      redirect_to team_path
    else
      render :edit
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    redirect_to teams_path
  end

  private
  def team_params
    params.require(:team).permit(:name, :introduction, :number, :address, :status, :image)
  end

end

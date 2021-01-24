class TeamsController < ApplicationController

  def index
    @teams = Team.all
    @sports = Sport.all
  end

  def new
    @team = Team.new
    @sport = Sport.where(is_active: 'true')
  end

  def create
    @team = Team.new(team_params)
    @team.user_id = current_user.id
    if @team.save!

      redirect_to teams_path
    else
      @teams = Team.all
      render "index"
    end
  end

  def show
    @team = Team.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @team = Team.find(params[:id])
    @sports = Sport.where(is_active: 'true')
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

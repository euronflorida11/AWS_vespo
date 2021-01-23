class SportsController < ApplicationController
  
  def index
    @sports = Sport.all
    @sport = Sport.new
  end

  def create
    @sport = Sport.new(sport_params)
    if @sport.save
      redirect_to sports_path
    else
      @sports = Sport.all
      render "index"
    end
  end

  def edit
    @sport = Sport.find(params[:id])
  end

  def update
    @sport = Sport.find(params[:id])
    if @sport.update(sport_params)
      redirect_to sports_path
    else
      render "edit"
    end
  end

  private
    def sport_params
        params.require(:sport).permit(:name, :is_active)
    end

end

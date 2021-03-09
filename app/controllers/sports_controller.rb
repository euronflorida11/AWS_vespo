class SportsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @sports = Sport.where(is_active: true).order(:name)
    @sport = Sport.new
  end

  def create
    @sport = Sport.new(sport_params)
    if @sport.save
      @tags = Vision.get_image_data(@sport.image)
      @tags.each do |tag|
        @sport.tags.create(name: tag)
      end
      redirect_to sports_path, notice: "ベンチャースポーツを作成しました。"
    else
      @sports = Sport.all
      render "index"
    end
  end

  def show
    @sports = Sport.where(is_active: true)
    @sport = Sport.find(params[:id])
  end

  def edit
    @sport = Sport.find(params[:id])
  end

  def update
    @sport = Sport.find(params[:id])
    if @sport.update(sport_params)
      redirect_to sports_path, notice: "ベンチャースポーツを更新しました。"
    else
      render "edit"
    end
  end
  
  def destroy
    @sport = Sport.find(params[:id])
    @sport.destroy
    flash[:notice] = "ベンチャースポーツを削除しました。"
    redirect_to sports_path
  end

  private
  def sport_params
    params.require(:sport).permit(:image, :user_id, :name, :is_active, :introduction)
  end
end

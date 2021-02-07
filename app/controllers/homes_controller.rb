class HomesController < ApplicationController
  def top
    @sports = Sport.all
    @teams = Team.all
    @users = User.all
  end

  def about
  end
  
  def index
    @infos = Info.all
  end

  def new
    @info = Info.new
  end

  def create
    @info = Info.new(info_params)
    if @info.save
      redirect_to about_path, notice: "お知らせを作成しました。"
    else
      render :new
    end
  end
end

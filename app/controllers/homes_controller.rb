class HomesController < ApplicationController
  
  def top
    @sports = Sport.all
    @teams = Team.all
    @users = User.all
  end

  def about
  end
  
end

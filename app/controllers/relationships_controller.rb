class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def follow
    @user = User.find(params[:id])
    current_user.follow(params[:id])
    render :create
    # current_user.follow(params[:id])
    # redirect_to request.referer
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.unfollow(params[:id])
    render :destroy
    # current_user.unfollow(params[:id])
    # redirect_to request.referer
  end
end

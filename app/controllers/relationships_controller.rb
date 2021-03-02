class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  
  def follow
    @user = User.find(params[:id])
    current_user.follow(params[:id])
    @user.create_notification_follow!(current_user)
    render :create
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.unfollow(params[:id])
    render :destroy
  end
end

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    team = Team.find(params[:team_id])
    comment = current_user.comments.new(comment_params)
    comment.team_id = team.id
    comment.save
    redirect_to team_path(team)
  end

  def destroy
    Comment.find_by(id: params[:id], team_id: params[:team_id]).destroy
    redirect_to team_path(params[:team_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end

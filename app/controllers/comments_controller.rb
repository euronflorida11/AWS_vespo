class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @team = Team.find(params[:team_id])
    @comment = @team.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment_team = @comment.team
    if @comment.save
      @comment_team.create_notification_comment!(current_user, @comment.id)
      render :index
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id], team_id: params[:team_id])
    @comment.destroy
    render :index
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :user_id, :team_id)
  end
end

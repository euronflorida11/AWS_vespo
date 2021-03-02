module NotificationsHelper

  def notification_form(notification)
    @visitor = notification.visitor
    @comment = nil
    your_team = link_to 'あなたの投稿', team_path(notification), style:"font-weight: bold;"
    @visitor_comment = notification.comment_id
    case notification.action
      when "follow" then
        tag.a(notification.visitor.handle_name, href:user_path(@visitor), style:"font-weight: bold;")+"があなたをフォローしました"
      when "favorite" then
        tag.a(notification.visitor.handle_name, href:user_path(@visitor), style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href:team_path(notification.team_id), style:"font-weight: bold;")+"にいいねしました"
      when "comment" then
          @comment = Comment.find_by(id: @visitor_comment)&.comment
          tag.a(@visitor.handle_name, href:user_path(@visitor), style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href:team_path(notification.team_id), style:"font-weight: bold;")+"にコメントしました"
    end
  end

  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end

end
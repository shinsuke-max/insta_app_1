# Preview all emails at https://72078581093c4119bb6a8080d9ab11c5.vfs.cloud9.ap-northeast-1.amazonaws.com/rails/mailers/relationship_mailer
class RelationshipMailerPreview < ActionMailer::Preview
  
  # https://72078581093c4119bb6a8080d9ab11c5.vfs.cloud9.ap-northeast-1.amazonaws.com/rails/mailers/relationship_mailer/follow_notification
  def follow_notification
    user = User.first
    follower = User.second
    RelationshipMailer.follow_notification(user, follower)
  end
  # https://72078581093c4119bb6a8080d9ab11c5.vfs.cloud9.ap-northeast-1.amazonaws.com/rails/mailers/relationship_mailer/unfollow_notification
  def unfollow_notification
    user = User.first
    follower = User.second
    RelationshipMailer.unfollow_notification(user, follower)
  end
end

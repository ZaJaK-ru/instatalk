class ActivityChannel < ApplicationCable::Channel
  def subscribed
    stream_from "activity_channel"

    if current_user
      current_user.update!(online: true)
      ActionCable.server.broadcast "activity_channel", { users: User.online }
    end
  end

  def unsubscribed
    if current_user
      current_user.update!(online: false)
      ActionCable.server.broadcast "activity_channel", { users: User.online }
    end
  end
end

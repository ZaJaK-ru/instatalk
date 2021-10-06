class ActivityChannel < ApplicationCable::Channel
  def subscribed
    stream_from "activity_channel"

    if current_user
      ActionCable.server.broadcast("activity_channel",
        { user: current_user.id, online: true })
      current_user.online = true
      current_user.save!
    end
  end

  def unsubscribed
    if current_user
      ActionCable.server.broadcast("activity_channel",
        { user: current_user.id, online: false })
      current_user.online = false
      current_user.save!
    end
  end
end

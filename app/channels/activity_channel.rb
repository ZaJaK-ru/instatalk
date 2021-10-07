class ActivityChannel < ApplicationCable::Channel
  def subscribed
    stream_from "activity_channel"

    if current_user
      ActionCable.server.broadcast("activity_channel", { user: current_user })
      current_user.update!(online: true)
    end
  end

  def unsubscribed
    if current_user
      ActionCable.server.broadcast("activity_channel", { user: current_user })
      current_user.update!(online: false)
    end
  end
end

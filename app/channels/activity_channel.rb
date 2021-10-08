class ActivityChannel < ApplicationCable::Channel
  def subscribed
    stream_from "activity_channel"

    current_user.update!(online: true)
    ActionCable.server.broadcast "activity_channel", { user: current_user }
  end

  def unsubscribed
    current_user.update!(online: false)
    ActionCable.server.broadcast "activity_channel", { user: current_user }
  end
end

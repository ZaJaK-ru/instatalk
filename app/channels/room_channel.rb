class RoomChannel < ApplicationCable::Channel
  def subscribed
    @room = Room.find(params[:roomId])

    stream_from "room_channel_#{@room.id}"
  end

  def unsubscribed
  end

  def speak(data)
    MessageService.new(
      body: data['message'], room: @room, user: current_user
    ).perform
  end
end

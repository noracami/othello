class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    if params[:personal]
      stream_from "chat_room_channel_#{current_user}"
      ActionCable.server.broadcast "chat_room_channel_#{current_user}",
                                   { from: 'system', message: "Welcome! #{current_user}" }
    else
      stream_from 'chat_room_channel'
      ActionCable.server.broadcast 'chat_room_channel', { from: 'system', message: "#{current_user} joined" }
    end
    Rails.logger.info 'subscribed'
  end

  def receive(data)
    Rails.logger.info "received: #{data}"
    ActionCable.server.broadcast 'chat_room_channel', { from: current_user, message: data['message'] }
  end
end

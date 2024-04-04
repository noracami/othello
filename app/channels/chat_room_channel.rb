class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    if params[:personal]
      stream_from "chat_room_channel_#{current_user}"
      ActionCable.server.broadcast "chat_room_channel_#{current_user}",
                                   { from: 'system', message: "Welcome! #{current_user}" }
    else
      stream_from 'chat_room_channel'
      ActionCable.server.broadcast 'chat_room_channel', { from: 'system', message: "#{current_user} joined" }
      $redis.hset('chat:room:channel:users', current_user, Time.now.to_i)
    end
    Rails.logger.info 'subscribed'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    message = "#{current_user} left"
    ActionCable.server.broadcast 'chat_room_channel', { from: 'system', message: }
    $redis.hset('chat:room:channel:users', current_user, Time.now.to_i)
    Rails.logger.info { message }
  end

  def receive(data)
    Rails.logger.info "received: #{data}"
    ActionCable.server.broadcast 'chat_room_channel', { from: current_user, message: data['message'] }
  end
end

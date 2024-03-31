module ApplicationCable
  class Channel < ActionCable::Channel::Base
    def unsubscribed
      # Any cleanup needed when channel is unsubscribed
      Rails.logger.info { 'unsubscribed' }
    end
  end
end

module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
      Rails.logger.info { "connected: #{current_user}" }
    end

    def disconnect
      Rails.logger.info { 'disconnected' }
    end

    protected

    def find_verified_user
      if (current_user = cookies.encrypted['_othello_session']&.dig('user_id'))
        current_user
      else
        :anonymous
      end
    end
  end
end

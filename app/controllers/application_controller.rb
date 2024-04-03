class ApplicationController < ActionController::Base
  helper_method :current_user

  private

  def mock_is_not_logged_in?
    session[:expires_at].nil? || session[:expires_at] < Time.current || session[:user_id].nil?

    # current_user.nil?
  end

  def mock_login
    session[:expires_at] = Time.current + 5.minutes.to_i
    session[:user_id] = SecureRandom.uuid

    # session[:user_id] = User.first.id
  end

  def current_user
    @current_user ||= session[:user_id]
  end
end

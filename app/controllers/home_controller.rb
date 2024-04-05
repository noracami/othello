class HomeController < ApplicationController
  def ask_zeabur_vars
    keys = %w[
      ZEABUR_WEB_URL
      ZEABUR_HTTP_URL
      ZEABUR_URL
      CONTAINER_HOSTNAME
    ]
    keys.each do |key|
      Rails.logger.info "#{key} = #{ENV.fetch(key, nil)}"
    end

    redirect_to root_path
    # Rails.logger.info "ENV['ZEABUR_VARS'] = #{ENV['ZEABUR_VARS']}"
  end
end

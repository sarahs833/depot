class ApplicationController < ActionController::Base
  helper_method :set_counter
  before_action :authorize
  before_action :set_i18n_locale_from_params

protected

  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to login_url, notice: "Please log in"
    end
  end

  def set_i18n_locale_from_params
    if params[:locale]
      if I18n.available_locales.map(&:to_s).include?(params[:locale])
        I18n.locale = params[:locale]
      else
        flash.now[:notice] = "#{params[:locale]} translation not available"
        logger.error flash.now[:notice]
      end
    end
  end

private
  def set_counter
    if session[:counter].nil?
      session[:counter] = 1
    else
      session[:counter] += 1
    end
  end

  def reset_counter
    session[:counter] = 0
  end
end

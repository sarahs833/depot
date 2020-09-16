class ApplicationController < ActionController::Base
  helper_method :set_counter

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

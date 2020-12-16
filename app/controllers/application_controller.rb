class ApplicationController < ActionController::Base
  helper_method :is_admin?

  def is_admin?
    session[:is_admin]
  end
end

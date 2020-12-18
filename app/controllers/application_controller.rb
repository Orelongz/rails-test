class ApplicationController < ActionController::Base
  def is_admin?
    session[:is_admin]
  end
end

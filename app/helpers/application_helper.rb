module ApplicationHelper
  def is_admin?
    session[:is_admin]
  end
end

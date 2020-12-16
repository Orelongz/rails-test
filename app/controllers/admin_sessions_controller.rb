class AdminSessionsController < ApplicationController
  before_action :require_admin_user, except: %i[new create]

  def new; end

  def create
    # NOTE: please NEVER use below code. This is just for illustration
    # purposes for this code and the ideal thing to do is to hash passwords

    if params[:username] == 'admin_user' && params[:password] == 'adm1n-U3er'
      session[:is_admin] = true
      redirect_to messages_path, notice: "Logged in!"
    else
      flash.now[:alert] = "Username or password is invalid"
      render "new"
    end
  end

  def toggle_message_visiblity
    Message.find(params[:message_id]).toggle(:visible).save
    redirect_to messages_path
  end

  def destroy
    session[:is_admin] = nil
    redirect_to root_url, notice: "Logged out!"
  end

  private

    def admin_session_params
      params.require(:admin_session).permit(:username, :password)
    end

    def require_admin_user
      unless is_admin?
        flash[:alert] = "You must be logged in to access this page"
        redirect_to root_url
        false
      end

      true
    end
end

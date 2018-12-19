class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      #@session_user = 1
      if @user.admin?
        redirect_to @user
      else
        redirect_to '/mainpage'
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      redirect_to root_url
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
 
end

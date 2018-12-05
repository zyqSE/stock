class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      # 登入用户，然后重定向到用户的资料页面
      log_in @user
      if @user.admin?
        redirect_to @user
      else
        redirect_to '/mainpage'
      end
    else
      # 创建一个错误消息
      flash.now[:danger] = 'Invalid email/password combination'
      redirect_to root_url
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
 
end

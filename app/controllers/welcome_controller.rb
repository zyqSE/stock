class WelcomeController < ApplicationController
  before_action :login_user,  only: [:mainpage]

  def home
  end
  def default
  end
  def mainpage
  end
  def signup
  end
  def login
  end
  def demoprediction
  end
  def demoevaluate
  end

  private
    def login_user
      #@session_user = 1
      unless logged_in?
        #flash[:danger] = "请登录"
        redirect_to login_url
      end
    end
end

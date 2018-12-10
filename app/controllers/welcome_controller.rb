class WelcomeController < ApplicationController
  before_action :correct_user, only: [:mainpage]

  def home
  end
  def default
    @history=[1,2,3,4,5]
  end
  def mainpage
  end
  def signup
  end
  def demoprediction
  end
  def demoevaluate
  end

  private
    def correct_user
      redirect_to(login_url) unless (request.referer == root_url)||(request.referer == signup_url)
    end
end

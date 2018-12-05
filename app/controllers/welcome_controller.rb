class WelcomeController < ApplicationController
  before_action :correct_user, only: [:mainpage]

  def home
  end
  def default
  end
  def mainpage
  end
  def signup
  end
  def demoprediction
  end

  private
    def correct_user
      redirect_to(login_url) unless (request.referer == root_url)||(request.referer == signup_url)
    end
end

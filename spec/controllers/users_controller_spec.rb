require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  context "user signup" do
    it "should success" do
      user_param = {name:'user_name', 
                    email:'sample@sample.com',
                    password:'password123', 
                    password_confirmation:'password123'}
      post:create, user:user_param
      expect(response).to redirect_to("/mainpage")
    end
    it "should fail due to pwd confirm" do
      user_param = {name:'user_name', 
                    email:'sample@sample.com',
                    password:'password123', 
                    password_confirmation:'password456'}
      post:create, user:user_param
      expect(response).to redirect_to("/signup")
    end
    it "should fail due to email format" do
      user_param = {name:'user_name', 
                    email:'sample.samplecom',
                    password:'password123', 
                    password_confirmation:'password123'}
      post:create, user:user_param
      expect(response).to redirect_to("/signup")
    end
  end
end

require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  context 'Get #home' do
    it 'shoule return a home page' do
      get :home
      expect(response).to be_success 
    end
  end
  context 'GET #signup and #login' do
    it 'should return a login page' do
      get :login
      expect(response).to be_success
    end
    it 'should return a signup page' do
      get :'signup'
      expect(response).to be_success
    end
  end 
  context 'GET #mainpage' do
    it 'should not return a mainpage' do
      get :mainpage
      expect(response).to redirect_to('/login')
    end
  end
end

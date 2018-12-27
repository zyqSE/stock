require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

    context 'User Login test' do
        before(:each) do
            @user = User.new(name: 'user_name', email: 'user1@sample.com', password: 'password123').save
            @admin = User.new(name:'admin_name', email:'admin@admin.com', password:'password789', admin: true).save
        end
        it 'should login as common user' do
            user_param = {email:'user1@sample.com', password:'password123'}
            post:create, session: user_param
            expect(response).to redirect_to("/mainpage") 
        end
        it 'should not login with incorrect pwd' do
            wrong_param = {email:'user1@sample.com', password:'password143' }
            post:create, session: wrong_param
            expect(response).to redirect_to(root_url) 
        end
        it 'should let admin login' do
            admin_param = {email:'admin@admin.com', password:'password789'}
            post:create, session: admin_param
            expect(response).to redirect_to(@admin)
        end
    end
end

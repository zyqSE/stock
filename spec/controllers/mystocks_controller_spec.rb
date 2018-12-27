require 'rails_helper'

RSpec.describe MystocksController, type: :controller do
    context 'Stock render page test' do
        it 'should return predict page' do
            code_num = '600600'
            get:prediction, code: code_num
            expect(assigns(:stock_code)).to eq(code_num)
            expect(response).to render_template("prediction")
        end
        it 'should return evaluate page' do
            code_num = '600600'
            get:evaluation, code: code_num
            expect(assigns(:stock_code)).to eq(code_num)
            expect(response).to render_template("evaluation")
        end
    end
end

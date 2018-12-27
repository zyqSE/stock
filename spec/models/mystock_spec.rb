require 'rails_helper'

RSpec.describe Mystock, type: :model do
  context 'insert test' do
    it 'should save successful' do
      stock = Mystock.new( name:'stock_name', code:'stock_code').save
      expect(stock).to eq(true) 
    end
  end
end

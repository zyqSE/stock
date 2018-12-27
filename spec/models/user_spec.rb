
require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensures name presense' do
      user = User.new(email: 'sample@sample.com', password: '12345678').save
      expect(user).to eq(false)
    end
    it 'ensures email presense' do
      user = User.new(name: 'Names', password: '123456678' ).save
      expect(user).to eq(false)
    end
  end
  context 'scope tests' do
  end

end

require 'test_helper'

class MystockTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should save succesful" do
    stock = Mystock.new(code:"stock_code", name:"stock_name")
    assert stock.save
  end
end

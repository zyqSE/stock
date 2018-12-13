class MystocksController < ApplicationController
require 'csv'
require 'json'
def index
  @mystocks = Mystock.all
end

def new
  @mystock = Mystock.new
end

def search
  # @stockDatas = Mystock.all
  #模糊查询
  @stockDatas = Mystock.where("code LIKE ?", "%#{params[:stock_code]}%")
  render :json=> @stockDatas
end

def price
  #history
  stock_code=600292
  stock_code=stock_code.to_s
  code=File.new("app/controllers/temp/code.txt","w")
  code.puts stock_code
  code.close
  #start_t=180.days.ago.strftime('%Y-%m-%d')
  #end_t=Time.now.strftime('%Y-%m-%d')
  `python app/controllers/temp/history.py`
  `python app/controllers/temp/csv2json.py app/controllers/temp/history.csv`
  json = File.read("app/controllers/temp/history.json")
  @history_price=JSON.parse(json)
  
  #future
end

def create
  @mystock = Mystock.new(mystock_params)
  @mystock.save
  redirect_to '/users/1'
end

def destroy
 Mystock.find(params[:id]).destroy
 redirect_to '/mystocks'
end

private
  def mystock_params
    params.require(:mystock).permit(:name,:code)
  end
end

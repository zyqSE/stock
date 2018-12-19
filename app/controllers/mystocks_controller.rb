class MystocksController < ApplicationController
require 'csv'
require 'json'

before_action :admin_user, only: [:index,:new]

def index
  @mystocks = Mystock.all
end

def new
  @mystock = Mystock.new
end

def search
  #@stockDatas = Mystock.all
  #模糊查询
  @stockDatas = Mystock.where("code LIKE ?", "%#{params[:stock_code]}%")
  render :json=> @stockDatas
end

def prediction
  @stock_code = params[:code]
end

def price
  #`python app/controllers/temp/autodelete.py`
  #history获取历史价格
  #stock_code=600292
  stock_code = params[:code]
  stock_code = stock_code.to_s
  stock_code = stock_code.rjust(6,'0')
  code = File.new("app/controllers/temp/code.txt","w")
  code.puts stock_code
  code.close
  #start_t=180.days.ago.strftime('%Y-%m-%d')
  #end_t=Time.now.strftime('%Y-%m-%d')
  data_file = "app/controllers/temp/data/history/history_" + stock_code + ".json"
  if File.exists?(data_file) then
    #@history_price = File.read(data_file)
  else
     `python app/controllers/temp/history.py`
     `python app/controllers/temp/csv2json.py`
     #json = File.read("app/controllers/temp/history.json")
  end
  @history_price = File.read(data_file)
  render :json=> @history_price
  
  #future获取预测价格
end

def evaluate
  cashflow_file="app/controllers/temp/data/evaluate/cashflow_data.json"
  debtpaying_file="app/controllers/temp/data/evaluate/cashflow_data.json"
  growth_file="app/controllers/temp/data/evaluate/growth_data.json"
  operation_file="app/controllers/temp/data/evaluate/operation_data.json"
  profit_file="app/controllers/temp/data/evaluate/profit_data.json"
  @cashflow = File.read(cashflow_file)
  @debtpaying = File.read(debtpaying_file)
  @growth = File.read(growth_file) 
  @operation = File.read(operation_file)
  @profit = File.read(profit_file)
  
  respond_to do |format|
  format.json  { render :json => {:cashflow => @cashflow, 
                                  :debtpaying => @debtpaying,
                                  :growth => @growth,
                                  :operation => @operation,
                                  :profit => @profit }}
  end
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
  
  def admin_user
    redirect_to(login_url) unless (logged_in?) && (current_user.admin?)
  end
end

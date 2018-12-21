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
  #history获取历史价格
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
     `python app/controllers/temp/history/history.py`
     `python app/controllers/temp/history/csv2json.py`
     #json = File.read("app/controllers/temp/history.json")
  end
  @history_price = File.read(data_file)
  #render :json=> @history_price
  
  #future获取预测价格
  future_data = "app/controllers/temp/data/future/future_" + stock_code + ".json"
  if File.exists?(future_data) then
    #@history_price = File.read(data_file)
  else
   `bash app/controllers/temp/future/future.sh`
    #json = File.read("app/controllers/temp/history.json")
  end
  @future_price = File.read(future_data)
  #render :json=> @future_price
  
  respond_to do |format|
  format.json  { render :json => {:history => @history_price,
                                  :future => @future_price }}
  end
end

#获取评估页面
def evaluation
  @stock_code = params[:code]
end

#获取评估数据
def evaluate

  stock_code = params[:code]
  stock_code = stock_code.to_s
  stock_code = stock_code.rjust(6,'0')

  #最近一个季度
  data_file = "app/controllers/temp/data/evaluate/evaluation_" + stock_code + ".json"
  #上一个季度
  old_file = "app/controllers/temp/data/evaluate/old_evaluation_" + stock_code + ".json"

  if File.exists?(data_file) && File.exists?(old_file) then
    #@history_price = File.read(data_file)
  else
    `bash app/controllers/temp/evaluation/evaluate.sh`
  end
  @evaluation = File.read(data_file)
  @old_evaluation = File.read(old_file)
  
  respond_to do |format|
  format.json  { render :json => {:evaluation => @evaluation, 
                                  :old_evaluation => @old_evaluation }}
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

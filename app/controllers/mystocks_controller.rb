class MystocksController < ApplicationController
def index
  @mystocks = Mystock.all
end

def new
  @mystock = Mystock.new
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

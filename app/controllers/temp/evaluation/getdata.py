import tushare as ts
import math
import pandas as pd
import sys
from datetime import datetime, date, timedelta

if __name__ == '__main__':
  reload(sys)
  sys.setdefaultencoding('utf-8')

  year1=datetime.now().strftime('%Y')
  month=datetime.now().strftime('%m')
  season1=math.ceil(int(month)/3)-1
  season1=int(season1)
  season2=season1-1
  
  if season2==0:
    year2 = int(year)-1
    season2 = 4
  else:
    year2 = year1

  profit_new = ts.get_profit_data(int(year1),season1)
  profit_old = ts.get_profit_data(int(year2),season2)
  #operation = ts.get_operation_data(int(year),season)
  #growth = ts.get_growth_data(int(year),season)
  #debtpaying = ts.get_debtpaying_data(int(year),season)
  cashflow_new = ts.get_cashflow_data(int(year1),season1)
  cashflow_old = ts.get_cashflow_data(int(year2),season2)

  profit_new.to_csv("profit_data.csv")
  profit_old.to_csv("old_profit_data.csv")
  #operation.to_csv("data/evaluate/operation_data.csv")
  #growth.to_csv("data/evaluate/growth_data.csv")
  #debtpaying.to_csv("data/evaluate/debtpaying_data.csv")
  cashflow_new.to_csv("cashflow_data.csv")
  cashflow_old.to_csv("old_cashflow_data.csv")

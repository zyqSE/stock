import tushare as ts
import math
import pandas as pd
import sys
from datetime import datetime, date, timedelta

if __name__ == '__main__':
  reload(sys)
  sys.setdefaultencoding('utf-8')

  year=datetime.now().strftime('%Y')
  month=datetime.now().strftime('%m')
  season=math.ceil(int(month)/3)-1
  season=int(season)

  profit = ts.get_profit_data(int(year),season)
  operation = ts.get_operation_data(int(year),season)
  growth = ts.get_growth_data(int(year),season)
  debtpaying = ts.get_debtpaying_data(int(year),season)
  cashflow = ts.get_cashflow_data(int(year),season)

  profit.to_csv("data/evaluate/profit_data.csv")
  operation.to_csv("data/evaluate/operation_data.csv")
  growth.to_csv("data/evaluate/growth_data.csv")
  debtpaying.to_csv("data/evaluate/debtpaying_data.csv")
  cashflow.to_csv("data/evaluate/cashflow_data.csv")

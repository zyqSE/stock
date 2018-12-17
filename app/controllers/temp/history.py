import tushare as ts
import pandas as pd
import sys
import os
from datetime import datetime, date, timedelta

def history (code, start, end):
        a  = ts.get_hist_data(str(code),start,end)   
        a.to_csv('app/controllers/temp/data/history.csv')
        #a.to_csv('history.csv')
        new = 'app/controllers/temp/data/history_'+str(code)+'.csv'
        os.rename('app/controllers/temp/data/history.csv',new)
        #os.rename('history.csv',new)
        
	

if __name__ == '__main__':
  code_file=open("app/controllers/temp/code.txt","r")
  #code_file=open("code.txt","r")
  code = code_file.read().splitlines()
  code_file.close()
  code=''.join(code)
  code=code.zfill(6)
  start = datetime.now()-timedelta(days = 180)
  start = start.strftime('%Y-%m-%d')
  end = datetime.now().strftime('%Y-%m-%d')
  history(code, start, end)


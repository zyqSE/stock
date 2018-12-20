# -*- coding: utf-8 -*-
import pandas as pd
import numpy as np
import os
import csv
from datetime import datetime, date, timedelta
from operator import itemgetter

code_file=open("app/controllers/temp/code.txt","r")
the_code = code_file.read().splitlines()
code_file.close()
the_code=''.join(the_code)
the_code=the_code.zfill(6)

input_file = "app/controllers/temp/future/future_" + the_code + ".csv"
output_file = open("app/controllers/temp/future/"+ the_code +".csv","w")

header='date,close'
output_file.write(header+'\n')

with open(input_file,'rb') as csvfile:
    data = csv.reader(csvfile)
    i=0
    for row in data:
      close=row[1]
      if close=="close":
        continue
      else:
        day=datetime.now()+timedelta(i)
        day=day.strftime('%Y-%m-%d')
        output_file.write(day+','+close+'\n')
        i=i+2
      
csvfile.close()
output_file.close()
os.remove(input_file)
#os.remove("cashflow_data.csv")

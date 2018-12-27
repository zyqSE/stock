# -*- coding: utf-8 -*-
import pandas as pd
import numpy as np
import os

from operator import itemgetter

code_file=open("app/controllers/temp/code.txt","r")
the_code = code_file.read().splitlines()
code_file.close()
the_code=''.join(the_code)
the_code=the_code.zfill(6)

input_file = "app/controllers/temp/evaluation/handleout.csv"
output_file = "app/controllers/temp/data/evaluate/evaluation_"+ the_code +".csv"

header='code,name,roe,net_profit_ratio,net_profits,eps,cf_sales,rateofreturn,cashflowratio'
#output_file.write(header+'\n')

#print header

with open(input_file, 'r') as file_in:
  with open(output_file, 'w') as file_out:
    file_out.write(header+'\n')
    for line in file_in:
      code=line.split(',')[0]
      if code == the_code: 
        name=line.split(',')[1]
        roe=line.split(',')[2]
        net_profit_ratio=line.split(',')[3]
        net_profits=line.split(',')[4]
        eps=line.split(',')[5]
        cf_sales=line.split(',')[6]
        rateofreturn=line.split(',')[7]
        cashflowratio=line.split(',')[8]
        file_out.write(code+','+name+','+roe+','+net_profit_ratio+','+net_profits+','+eps+','+cf_sales+','+rateofreturn+','+cashflowratio)
        break
      else:
        continue

file_in.close()
file_out.close()

#os.remove("profit_data.csv")
#os.remove("cashflow_data.csv")

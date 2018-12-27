# -*- coding: utf-8 -*-
import pandas as pd
import numpy as np
import os
import csv

from operator import itemgetter

code_file=open("app/controllers/temp/code.txt","r")
the_code = code_file.read().splitlines()
code_file.close()
the_code=''.join(the_code)
the_code=the_code.zfill(6)

#input_file1 = open("app/controllers/temp/evaluation/profit_data.csv")
#input_file2 = open("app/controllers/temp/evaluation/cashflow_data.csv")

#output_file = open("app/controllers/temp/evaluation/handleout.csv","w")

input_file1 = open("app/controllers/temp/evaluation/old_profit_data.csv")
input_file2 = open("app/controllers/temp/evaluation/old_cashflow_data.csv")

output_file = open("app/controllers/temp/evaluation/handleout2.csv","w")

table1=csv.reader(input_file1,delimiter=',')
table_sorted1 = sorted(table1, key=lambda x: x[1])
table_sorted1.pop()

table2=csv.reader(input_file2,delimiter=',')
table_sorted2 = sorted(table2, key=lambda x: x[1])
table_sorted2.pop()

header='code,name,roe,net_profit_ratio,net_profits,eps,cf_sales,rateofreturn,cashflowratio'
output_file.write(header+'\n')
#print header
i=0
table_sorted1[i]=table_sorted1[i]+table_sorted2[i]
while i < len(table_sorted1):
  table_sorted1[i]=table_sorted1[i]+table_sorted2[i]
  i=i+1

table=table_sorted1
for row in table:                    #遍历读取排序后的嵌套列表
  code=row[1]
  name=row[2]
  roe=row[3]
  net_profit_ratio=row[4]
  net_profits=row[6]
  eps=row[7]
  cf_sales=row[13]
  rateofreturn=row[14]
  cashflowratio=row[17]
  output_file.write(code+','+name+','+roe+','+net_profit_ratio+','+net_profits+','+eps+','+cf_sales+','+rateofreturn+','+cashflowratio+'\n')
  #break

input_file1.close()
input_file2.close()
output_file.close()

#os.remove("app/controllers/temp/evaluation/profit_data.csv")
#os.remove("app/controllers/temp/evaluation/cashflow_data.csv")

os.remove("app/controllers/temp/evaluation/old_profit_data.csv")
os.remove("app/controllers/temp/evaluation/old_cashflow_data.csv")

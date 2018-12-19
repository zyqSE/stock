# -*- coding: utf-8 -*-
import pandas as pd
import numpy as np
import os

from operator import itemgetter

code_file=open("../code.txt","r")
the_code = code_file.read().splitlines()
code_file.close()
the_code=''.join(the_code)
the_code=the_code.zfill(6)

input_file1 = open("old_profit_data.csv")
input_file2 = open("old_cashflow_data.csv")
output_file = open("../data/evaluate/old_evaluation_"+ the_code +".csv","w")

table1 = []
for line in input_file1:
    col = line.split(',') #每行分隔为列表，好处理列格式
    col[1] = str(col[1])
    table1.append(col) #嵌套列表table[[8,8][*,*],...]

table_sorted1 = sorted(table1, key=itemgetter(1))#先后按列索引3,4排序

table2 = []
for line in input_file2:
    col = line.split(',') #每行分隔为列表，好处理列格式
    col[1] = str(col[1])
    table2.append(col) #嵌套列表table[[8,8][*,*],...]

table_sorted2 = sorted(table2, key=itemgetter(1))#先后按列索引3,4排序


header='code,name,roe,net_profit_ratio,net_profits,eps,cf_sales,rateofreturn,cashflowratio'
output_file.write(header+'\n')

#print header

for row1 in table_sorted1:                    #遍历读取排序后的嵌套列表
  for row2 in table_sorted2:
      code=row1[1]
      if code == the_code:
        name=row1[2]
        roe=row1[3]
        net_profit_ratio=row1[4]
        net_profits=row1[6]
        eps=row1[7]
        cf_sales=row2[3]
        rateofreturn=row2[4]
        cashflowratio=row2[7]
        output_file.write(code+','+name+','+roe+','+net_profit_ratio+','+net_profits+','+eps+','+cf_sales+','+rateofreturn+','+cashflowratio)
        break
      else:
        continue

input_file1.close()
input_file2.close()
output_file.close()

#os.remove("old_profit_data.csv")
#os.remove("old_cashflow_data.csv")

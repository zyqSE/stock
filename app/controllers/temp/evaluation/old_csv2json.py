import sys
import json
import io
import os
import pandas as pd
reload(sys)
sys.setdefaultencoding( "utf-8" )

#code_file=open("app/controllers/temp/code.txt","r")
code_file=open("../code.txt","r")
code = code_file.read().splitlines()
code_file.close()
code=''.join(code)
code=code.zfill(6)

input_file = "../data/evaluate/old_evaluation_" + code + ".csv"
lines = io.open(input_file, "r", encoding="utf_8_sig").readlines()

lines = [line.strip() for line in lines]

keys = lines[0].split(',')
#print keys
line_num = 1
total_lines = len(lines)

parsed_datas = []
while line_num < total_lines:
        values = lines[line_num].split(",")
        #values[1] = str(values[1])
        parsed_datas.append(dict(zip(keys, values)))

        line_num = line_num + 1

json_str = json.dumps(parsed_datas, ensure_ascii=False, indent=4)
output_file = input_file.replace("csv", "json")

f = open(output_file, "w")
f.write(json_str)
f.close()

os.remove(input_file)

import sys
import json
import io
import os

code_file=open("app/controllers/temp/code.txt","r")
#code_file=open("code.txt","r")
code = code_file.read().splitlines()
code_file.close()
code=''.join(code)
code=code.zfill(6)

input_file = 'app/controllers/temp/history_' + code + '.csv'
lines = io.open(input_file, "r", encoding="utf_8_sig").readlines()

lines = [line.strip() for line in lines]

keys = lines[0].split(',')


line_num = 1
total_lines = len(lines)

parsed_datas = []
while line_num < total_lines:
        values = lines[line_num].split(",")
        values[1] = str(values[1])
        parsed_datas.append(dict(zip(keys, values)))

        line_num = line_num + 1

json_str = json.dumps(parsed_datas, ensure_ascii=False, indent=4)
#output_file = input_file.replace("csv", "json")
output_file = 'app/controllers/temp/data/history/history_' + code + '.json'

f = open(output_file, "w")
f.write(json_str)
f.close()

#os.remove(input_file)

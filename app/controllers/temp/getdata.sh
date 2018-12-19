#!/bin/sh

python getdata.py

cashflow_file='data/evaluate/cashflow_data.csv'
python eval_csv2json.py $cashflow_file

debtpaying_file='data/evaluate/debtpaying_data.csv'
python eval_csv2json.py $debtpaying_file

profit_file="data/evaluate/profit_data.csv"
python eval_csv2json.py $profit_file

growth_file="data/evaluate/growth_data.csv"
python eval_csv2json.py $growth_file

operation_file="data/evaluate/operation_data.csv"
python eval_csv2json.py $operation_file


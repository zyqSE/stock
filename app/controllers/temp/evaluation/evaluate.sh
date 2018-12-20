#!/bin/sh
path=pwd
echo "wwwwwwwwwwwwwwwwwwww"

echo path
python app/controllers/temp/evaluation/simple.py
python app/controllers/temp/evaluation/old_simple.py
python app/controllers/temp/evaluation/csv2json.py
python app/controllers/temp/evaluation/old_csv2json.py

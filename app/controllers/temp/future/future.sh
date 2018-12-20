#!/bin/sh
python app/controllers/temp/future/predict.py
python app/controllers/temp/future/handle.py
python app/controllers/temp/future/csv2json.py

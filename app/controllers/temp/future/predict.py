import os
import json
import time
import math
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from core.data_processor import DataLoader
from core.model import Model
import tushare as ts
import sys
import datetime as dt

def main():
    code_file=open("app/controllers/temp/code.txt","r")
    #code_file=open("/root/stock/app/controllers/temp/code.txt","r")
    the_code = code_file.read().splitlines()
    code_file.close()
    the_code=''.join(the_code)
    the_code=the_code.zfill(6)

    input_file = "app/controllers/temp/history_" + the_code + ".csv"
    output_file = "app/controllers/temp/future/future_" + the_code +".csv"
    #input_file = "/root/stock/app/controllers/temp/data/history/history_" + the_code + ".csv"
    #output_file = "/root/stock/app/controllers/temp/future/future_" + the_code +",csv"


    configs = json.load(open('app/controllers/temp/future/config.json', 'r'))

    data = DataLoader(
        input_file,
        configs['data']['train_test_split'],
        configs['data']['columns']
    )
    model = Model()
    model.load_model("app/controllers/temp/future/model.h5")
    x_test, y_test, data_raw = data.get_test_data(
        seq_len=configs['data']['sequence_length'],
        normalise=configs['data']['normalise']
    )

    predictions = model.predict_sequences_multiple(x_test, configs['data']['sequence_length'], configs['data']['sequence_length'])
    predicted=[]
    for i, data in enumerate(predictions):
        predicted=predicted+data
    data_raw = np.array(data_raw).astype(float)
    denormalised_data = []
    for i in range(len(predicted)):
        denormalised_col = (float(predicted[i])+1)*float(data_raw[i, 0, 0])
        denormalised_data.append(denormalised_col)
    name = ['close']
    test = pd.DataFrame(columns=name,data=denormalised_data)
    test.to_csv(output_file)
    os.remove(input_file)


if __name__ == '__main__':
    main()

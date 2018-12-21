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
    #model = Model()
    model_close = Model()
    model_open = Model()
    model_high = Model()
    model_low = Model()

    #model.load_model("app/controllers/temp/future/model.h5")
    model_close.load_model("app/controllers/temp/future/close.h5")
    model_open.load_model("app/controllers/temp/future/open.h5")
    model_high.load_model("app/controllers/temp/future/high.h5")
    model_low.load_model("app/controllers/temp/future/low.h5")
    x_test, y_test, data_raw = data.get_test_data(
        seq_len=configs['data']['sequence_length'],
        normalise=configs['data']['normalise']
    )

    x_close = x_test[:,:,[0,4]]
    x_open = x_test[:,:,[1,4]]
    x_high = x_test[:,:,[2,4]]
    x_low = x_test[:,:,[3,4]]

    #predictions = model.predict_sequences_multiple(x_test, configs['data']['sequence_length'], configs['data']['sequence_length'])
    predictions_close = model_close.predict_sequences_multiple(x_close, configs['data']['sequence_length'], configs['data']['sequence_length'])
    predictions_open = model_open.predict_sequences_multiple(x_open, configs['data']['sequence_length'], configs['data']['sequence_length'])
    predictions_high = model_high.predict_sequences_multiple(x_high, configs['data']['sequence_length'], configs['data']['sequence_length'])
    predictions_low = model_low.predict_sequences_multiple(x_low, configs['data']['sequence_length'], configs['data']['sequence_length'])

 
    predicted=[]
#    for i, data in enumerate(predictions):
#        predicted=predicted+data

    predicted_close=[]
    for i, data in enumerate(predictions_close):
        predicted_close=predicted_close+data
    predicted_open=[]
    for i, data in enumerate(predictions_open):
        predicted_open=predicted_open+data
    predicted_high=[]
    for i, data in enumerate(predictions_high):
        predicted_high=predicted_high+data
    predicted_low=[]
    for i, data in enumerate(predictions_low):
        predicted_low=predicted_low+data

    predicted.append(predicted_close)
    predicted.append(predicted_open)
    predicted.append(predicted_high)
    predicted.append(predicted_low)

    data_raw = np.array(data_raw).astype(float)
    denormalised_data = []

    predicted = np.array(predicted).astype(float)

#    for i in range(len(predicted)):
#        denormalised_col = (float(predicted[i])+1)*float(data_raw[i, 0, 0])
#        denormalised_data.append(denormalised_col)

    for i in range(predicted.shape[0]):
        denormalised_window = []
        for j in range(predicted.shape[1]):
            denormalised_col = (float(predicted[i,j])+1)*float(data_raw[j,i, 0])
            denormalised_window.append(denormalised_col)
        denormalised_data.append(denormalised_window)
    denormalised_data = np.array(denormalised_data).T
    #print denormalised_data

    name = ['close','open','high','low']
    test = pd.DataFrame(columns=name,data=denormalised_data)
    test.to_csv(output_file)
    os.remove(input_file)


if __name__ == '__main__':
    main()

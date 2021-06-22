import serial
import threading
import time

import matplotlib.animation as ani
import matplotlib.pyplot as plt
import numpy as np

headers = ["Time (s)", "Temperature (°C)", "Humidity (%)", "Pressure (hPa)", "Gas (KOhms)"]
start = time.time()
BAUDRATE = 115200
ser = serial.Serial('/dev/ttyUSB0', baudrate=BAUDRATE)
MAX_NUM = 100

def read_serial(): 
    data = {h:[] for h in headers}
    while True:
        # print("Reading")
        ser_bytes = ser.readline()
        ser_bytes = ser_bytes.decode()
        print(ser_bytes)
        ser_bytes = ser_bytes.strip().strip(';').split(";")
        ser_bytes = [float(s.split(":")[1]) for s in ser_bytes]
        for i,k in enumerate(data.keys()):
            if len(data[k]) > MAX_NUM:
                if k == "Time": data[k] = list(data[k][1:]) + [time.time() - start]
                else: data[k] = list(data[k][1:]) + [ser_bytes[i-1]]
            else:
                if k == "Time": data[k].append(time.time() - start)
                else: data[k].append(ser_bytes[i-1])
        vals = list(data.values())
        yield vals[0], vals[1:]


def plot(record = False):
    fig = plt.figure(figsize=(80, 60))

    axes = [
        fig.add_subplot(221),
        fig.add_subplot(222),
        fig.add_subplot(223),
        fig.add_subplot(224)
    ]
    rs = read_serial()

    x, ys = next(rs)
    points = [axes[i].plot(x, ys[i])[0] for i in range(len(ys))]

    for i in range(len(axes)):
        axes[i].set_ylabel(headers[i + 1])

    def draw_data(j):
        x, ys = next(rs)
        for i in range(len(axes)):
            axes[i].set_xlim([x[0], x[-1]])   
            axes[i].set_ylim([min(ys[i]), max(ys[i])])   
            points[i].set_data(x, ys[i])
            axes[i].draw_artist(points[i])
        

    animator = ani.FuncAnimation(fig, draw_data, interval = 2000)
    plt.show()
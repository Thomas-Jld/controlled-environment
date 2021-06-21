import threading
import time

import matplotlib.pyplot as plt
import numpy as np#

headers = ["Time", "Temperature", "Humidity", "Pressure", "Gas"]

def read_serial(): 
    data = {h:np.zeros(100) for h in headers}
    while True:
        for k in data.keys():
            data[k] = data[k][1:] + [data[k][-1] + 0.001]
        yield data.values()


def plot(record = False):
    fig = plt.figure()

    figManager = fig.canvas.manager
    figManager.window.showMaximized()

    ax1 = fig.add_subplot(221)
    ax2 = fig.add_subplot(222)
    ax3 = fig.add_subplot(223)
    ax4 = fig.add_subplot(224)
    rs = read_serial()

    x, y1, y2, y3, y4 = next(rs)
    points1 = ax1.plot(x, y1, 'o')[0]
    points2 = ax2.plot(x, y3, 'o')[0]
    points3 = ax3.plot(x, y2, 'o')[0]
    points4 = ax4.plot(x, y4, 'o')[0]

    plt.show(block=False)

    plt.pause(0.1)

    bg = fig.canvas.copy_from_bbox(fig.bbox)

    ax1.draw_artist(points1)
    ax2.draw_artist(points2)
    ax3.draw_artist(points3)
    ax4.draw_artist(points4)

    fig.canvas.blit(fig.bbox)

    while True:
        x, y1, y2, y3, y4 = next(rs)
        points1.set_data(x, y1)
        points2.set_data(x, y2)
        points3.set_data(x, y3)
        points4.set_data(x, y4)

        fig.canvas.restore_region(bg)

        plt.pause(0.01)

        points1.set_data(x, y1)
        ax1.draw_artist(points1)

        points2.set_data(x, y2)
        ax2.draw_artist(points2)

        points3.set_data(x, y3)
        ax3.draw_artist(points3)

        points4.set_data(x,y4)
        ax4.draw_artist(points4)

        fig.canvas.blit(ax1.bbox)

        # fig.canvas.blit(ax1.bbox)
        # fig.canvas.blit(ax2.bbox)
        # fig.canvas.blit(ax3.bbox)
        # fig.canvas.blit(ax4.bbox)

        fig.canvas.flush_events()
        

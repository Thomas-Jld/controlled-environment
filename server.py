import ast
import os
import threading
from queue import Queue

from flask import Flask, redirect, render_template, request, session
from flask_cors import CORS
from flask_socketio import SocketIO

PORT = os.getenv("PORT", default=27170)

lines = Queue()

sensors = {}

def writer():
    """ 
    Saves every results in a single file everytime the queue
    gets updated
    """
    while True:
        line = lines.get() # Waits for a new entry
        with open("results/results.csv", "a+") as f:
            f.write(line)  # Adds the line at the bottom


threading.Thread(target=writer, daemon=True).start()

app = Flask(__name__)
app.secret_key = "DieWiedervere1nigung"
CORS(app)
sio = SocketIO(app)


@app.route('/controlledenvironment/home', methods=["GET", "POST"])
def home():
    return render_template("home.html")

@app.route('/controlledenvironment/monitor', methods=["GET", "POST"])
def monitor():
    return render_template("monitor.html")

@app.route('/controlledenvironment/configure', methods=["GET", "POST"])
def configure():
    return render_template("configure.html")



@app.route('/controlledenvironment/submit/', methods=["GET", "POST"])
def submit():
    data = ast.literal_eval(request.data.decode().lower())
    sensors[data["id"]] = data
    print(sensors)
    sio.emit('update', data)
    return "200"

if __name__ == "__main__":
    sio.run(app, host="0.0.0.0", port=PORT, debug=True)
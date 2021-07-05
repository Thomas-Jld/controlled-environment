import os
import threading
from queue import Queue

from flask import Flask, redirect, render_template, request, session
from flask_cors import CORS

PORT = os.getenv("PORT", default=27170)

lines = Queue()

def writer():
    """ 
    Saves every results in a single file everytime the queue
    gets updated
    """
    while True:
        line = lines.get() # Waits for a new entry
        with open("results/results_probe.csv", "a+") as f:
            f.write(line)  # Adds the line at the bottom


threading.Thread(target=writer, daemon=True).start()

app = Flask(__name__)
app.secret_key = "DieWiedervere1nigung"
CORS(app)

@app.route('/controlledenvironment/home/', methods=["GET", "POST"])
def home():
    return render_template("home.html")

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=PORT)

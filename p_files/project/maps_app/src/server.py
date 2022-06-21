from flask import Flask

from .funcs import get_ip

app = Flask(__name__)


@app.route("/")
def hello():
    a = "Hello"
    b = "World777"
    return "-".join((a, b, "VPS IP ", get_ip()))

from flask import Flask

from .funcs import concat_str, get_time

app = Flask(__name__)


@app.route("/")
def hello():
    a = "Hello"
    b = "world"
    return concat_str(a, b, "UTC time: ", get_time())

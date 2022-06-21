from datetime import datetime


def get_time():
    now = datetime.now()
    return now.strftime("%H:%M:%S")


def concat_str(*args):
    return " ".join(map(str, args))

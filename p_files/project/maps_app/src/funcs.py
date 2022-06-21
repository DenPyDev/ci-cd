import requests


def get_ip():
    ip = requests.get(url="https://api.ipify.org/?format=json").json()["ip"]
    return str(ip)

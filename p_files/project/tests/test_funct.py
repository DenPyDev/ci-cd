from main_app.src.funcs import concat_str, get_time
from maps_app.src.funcs import get_ip


def test_str():
    assert len(concat_str("qwe", 123)) == 7


def test_time():
    assert 4 < len(get_time()) < 20


def test_ip():
    assert 8 < len(get_ip()) < 20

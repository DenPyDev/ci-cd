## Run locally

### Run tests
  - ```pip3 install -r project/tests/requirements.txt```
  - ```python3 -m pytest```

### Run linter
  - ```pip3 install flake8```
  - ```flake8 .```

### Run docker-compose
- ```docker-compose up --build```

### Run separately
main_app
  - ```cd dockerfile project/main_app```
    - ```docker build -t my_main_app .```
    - ```docker run -p 5000:5000 my_main_app```

maps_app
  - ```cd dockerfile project/maps_app```
    - ```docker build -t my_maps_app .```
    - ```docker run -p 3000:3000 my_maps_app```

### Check results
- open [http://127.0.0.1:3000/](http://127.0.0.1:3000/)
- open [http://127.0.0.1:5000/](http://127.0.0.1:5000/)


# DRONE-CI
[Youtube tutorial](https://www.youtube.com/watch?v=diDO4q-OqZs&t=5432s)

    10.10.10.10 = Your VPS IP

Create app
- https://github.com/settings/apps
- OAuth Apps
- Press "New OAuth App"
- Name: Drone
- Homepage URL: http://10.10.10.10
- Authorization callback URL:http://10.10.10.10:81/login
- Press "Register application"

Get creds
- copy Client ID
- Generate and copy Client Secret 
- Press "Update application"


VPS
- Rent VPS and set up ssh auth for it
- Open the VPS terminal as a root
```
apt update
apt -y install docker.io
apt -y install docker-compose
apt -y install nano

mkdir ci-cd
cd ci-cd

nano docker-compose.yml
```
- Copy/paste [docker-compose.yml](docker-compose.yml) text
- Save

```
  nano .env.docker
```
- Copy/paste [.env.docker](.env.docker) text
    VPS_IP = 10.10.10.10
    ADMIN_USERNAME=admin username
    GITHUB_CLIENT_ID= app creds "Client ID"
    GITHUB_CLIENT_SECRET=app creds "Client Secret"

    generate string wich "openssl rand -hex 16"
    set it as DRONE_RPC_SECRET

- Save
```
docker-compose --env-file .env.docker up --build
```

Set up
- Open http://10.10.10.10:81
- Check if it's authorized

- Open Github 
- Create repo

Local computer
- Copy drone_config/.drone.yml to p_files
```
git init in p_files
git push
```


- Open Drone http://10.10.10.10:81 
- Press SYNC
- Press "activate" on your project
- Press "activate project"
- Open project settings/secrets
- Create VPS_IP and SSH_PRIVATE_KEY
- Copy values from drone_config/secrets

- Set Project settings/"ProtectedTrusted" Checked
- Save

Finish
- Make empty commit
- Pipline start executing



- Open flask app1 http://10.10.10.10:3000
- Open flask app2  http://10.10.10.10:5000

- Check it's up and running

- On http://10.10.10.10:81/ Project settings
you can find a badge and pot in in readme
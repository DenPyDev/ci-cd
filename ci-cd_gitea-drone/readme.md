# DRONE-CI
[Youtube tutorial](https://www.youtube.com/watch?v=diDO4q-OqZs&t=5432s)

    10.10.10.10 = Your VPS IP

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
- Save
```
docker-compose --env-file .env.docker up --build
```

Set up
- open http://10.10.10.10:80
- Press "Sign in"
- set Gitea Base http://10.10.10.10:80/

- Open Administrator Account Settings
- Administrator Username denis
- Password 111111
- Add any Email Address
- Press Install gitea 

Create app
- Account settings
- Applications
- Manage OAuth2 Applications
- Application Name: drone
- Redirect URI: http://10.10.10.10:81/login
- Press Save

Get creds
- copy Client ID
- copy Client Secret 
- Press Save
- stop docker
```
 nano .env.docker
    ADMIN_USERNAME=admin username
    GITEA_CLIENT_ID= app creds "Client ID"
    GITEA_CLIENT_SECRET=app creds "Client Secret"

    generate string wich "openssl rand -hex 16"
    set it as DRONE_RPC_SECRET
```
- Save
```
docker-compose --env-file .env.docker up --build
```

- Open http://10.10.10.10:81
- Check if it's authorized

- Open http://10.10.10.10
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

# Gitlab-CI

Gitlab preparation
- Create a new "blank project"
  - Project deployment target: Not selected 
  - Setting "Initialize repository with a README": Unchecked
  - Setting "Enable Static Application Security Testing (SAST)": Unchecked
- Open project
- Settings
- CI/CD

Set Variables
- Variables (Press Expand)
- Press (Add variable)
  - Key: SSH_PRIVATE_KEY
  - Value: your private key form /home/home/.ssh/id_rsa
  - Type: File
  - Setting "Protect variable": Checked
  - Setting "Mask variable": Unchecked
  - Save
- Press (Add variable)
  - Key: VPS_IP
  - Value: your VPS IPv4
  - Type: Variable
  - Setting "Protect variable": Unchecked
  - Setting "Mask variable": Unchecked
  - Save

Set Runners
- Runners (Press Expand)
- Setting "Enable shared runners for this project": Unchecked, disable
- Copy registration TOKEN
  
Gitlab-runner deployment
- Rent VPS and set up ssh auth for it
- Open the VPS terminal as a root
- ```mkdir ci-cd```
- ```cd ci-cd```
- ```apt update```
- ```apt -y install docker.io```
- ```apt -y install docker-compose```
- ```apt -y install nano```
- ```nano gitlab-runner.sh```
- Copy/paste [GitLab-runner.sh](runner/gitlab-runner.sh) text
- Save
- In the following command replace TOKEN with your GitLab-runner token and run
- ```sh gitlab-runner.sh -t TOKEN```
- Check /Settings/CI-CD/Runners/ page on Gitlab, one runner appears, it's up and running

Gitlab deployment preparation
- Open project
- Settings
- CI/CD



First deploy

Local computer
- Copy gitlab_config/.gitlab-ci.yml to p_files
```
git init in p_files
git push
```
- Open project
- CI/CD
- Pipelines
- ✨It's working✨

Check results
- open [http://SERVER_IP:3000/](http://SERVER_IP:3000/)
- open [http://SERVER_IP:5000/](http://SERVER_IP:5000/)


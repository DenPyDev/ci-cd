 - setup drone for github

 - create account on docker.com
 - create token in account settings
 - create repo

 - add path to repo to drone secrets "registry_repo" = denisbackenddev/my_oriv_repo
 - add docker username to drone secrets "registry_username" = name
 - add docker token to drone secrets "registry_password" = token


 - git push proj

 - it will publish container to docker.com

 - ssh to server

 - copy server/docker-compose.yml
 - docker-compose up --build

 - edit proj in some way
 - git push proj

----------------

 - 1. new docker image version will apear in repo
 - 2. it will rollout on server 

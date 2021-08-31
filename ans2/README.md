# ft_services

# Caution!!!

local VM setting will change

# setup.sh

intalls and uninstall

- --vm-driver=none 

- sudo apt-get install lftp

- sudo apt install conntrack

- sudo dpkg -r --force-depends golang-docker-credential-helpers

- persistent volume will make "/data"

# shutdown.sh

all docker containers and images will delete.

- docker ps -aq | xargs docker rm

- docker images -aq | xargs docker rmi

- docker volume rm "$(docker volume ls -qf dangling=true)"

- sudo rm -rf /data

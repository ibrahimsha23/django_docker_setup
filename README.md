### Django Docker Setup
 1. Install Docker and Docker Compose.
 
     ```wget -qO- https://get.docker.com/ | sh``` => Install Docker 
     
     ```sudo usermod -aG docker $(whoami)``` => Create docker group 
     
     ```sudo apt-get -y install python-pip```
     
     ```sudo pip install docker-compose``` => Install Docker Compose
     
 2. Kill the services which is running in port `8000`.
 3. Run this Command to build and run the web container service `docker-compose up --force-recreate  --build -d`.
 4. Run this Command to restart the web container service as daemon `docker-compose up -d`.
 5. Run this command to view the running containers `docker-compose ps`.
 
 (Login into Docker container using command `docker exec -it django_web bash`)
 
 (Use `-d` in Docker command to run as a daemon service)
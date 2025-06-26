# Dockerize-Flask-App

Simple Flask app containerized with Docker.


## Docker Commands
```bash
# Build
docker build -t flask-app .

# Run
docker run -p 5000:5000 flask-app

# Run detached
docker run -d -p 5000:5000 flask-app

# Stop
docker stop <container-id>
```
 
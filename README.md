# Dockerize-Flask-App [![Build and Test](https://github.com/vinithreddybanda/Dockerize-Flask-App/actions/workflows/docker-build.yml/badge.svg)](https://github.com/vinithreddybanda/Dockerize-Flask-App/actions/workflows/docker-build.yml)

Simple Flask app containerized with Docker.

## Quick Start
```bash
docker build -t flask-app .
docker run -p 5000:5000 flask-app
```
Open http://localhost:5000

## Commands
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
 

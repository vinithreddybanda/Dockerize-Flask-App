#!/bin/bash

if ! command -v docker &> /dev/null; then
    echo "Docker not found"
    exit 1
fi

echo "Building image..."
docker build -t flask-app .

if [ $? -eq 0 ]; then
    echo "Starting container..."
    docker run -d -p 5000:5000 --name flask-app flask-app
    echo "Running at http://localhost:5000"
    echo "Stop: docker stop flask-app"
else
    echo "Build failed"
fi

try {
    docker --version | Out-Null
} catch {
    Write-Host "Docker not found"
    exit 1
}

Write-Host "Building image..."
docker build -t flask-app .

if ($LASTEXITCODE -eq 0) {
    Write-Host "Starting container..."
    docker run -d -p 5000:5000 --name flask-app flask-app
    Write-Host "Running at http://localhost:5000"
    Write-Host "Stop: docker stop flask-app"
} else {
    Write-Host "Build failed"
}

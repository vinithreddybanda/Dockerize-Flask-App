# Ultra-minimal multi-stage build for smallest possible image
# Stage 1: Build stage with full Python environment
FROM python:3.9-alpine AS builder

# Install build dependencies
RUN apk add --no-cache gcc musl-dev

# Set the working directory
WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir --target=/app/deps -r requirements.txt

# Stage 2: Ultra-minimal runtime with distroless
FROM gcr.io/distroless/python3-debian11

# Copy Python dependencies from builder
COPY --from=builder /app/deps /app/deps

# Copy the application code
COPY app.py /app/

# Set Python path to find dependencies
ENV PYTHONPATH=/app/deps

# Set working directory
WORKDIR /app

# Expose port 5000
EXPOSE 5000

# Set environment variables for Flask
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# Run the application directly with Python
CMD ["python3", "app.py"]

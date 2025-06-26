# Minimal multi-stage build
FROM python:3.9-alpine AS builder

# Install build dependencies
RUN apk add --no-cache gcc musl-dev

# Set working directory
WORKDIR /app

# Copy and install requirements
COPY requirements.txt .
RUN pip install --no-cache-dir --target=/app/deps -r requirements.txt

# Final runtime stage
FROM python:3.9-alpine

# Copy dependencies from builder
COPY --from=builder /app/deps /usr/local/lib/python3.9/site-packages/

# Copy application
COPY app.py /app/

# Set working directory
WORKDIR /app

# Expose port
EXPOSE 5000

# Run the application
CMD ["python3", "app.py"]

# Use compatible Python base image
FROM python:3.10-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    && apt-get clean

# Upgrade pip to compatible version
RUN pip install --upgrade "pip<24.1"

# Set working directory
WORKDIR /app

# Copy your app code
COPY . /app

# Install dependencies (ensure requirements.txt exists)
RUN pip install --no-cache-dir -r requirements.txt

# Expose port (you can change this as needed)
EXPOSE 8000

# Command to run your app
CMD ["python", "apps/api_expose.py"]

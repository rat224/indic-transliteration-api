# Use Python 3.10 since 3.13 is not compatible
FROM python:3.10-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Create working directory
WORKDIR /app

# Install pip <24.1 to avoid metadata issues
RUN pip install --upgrade "pip<24.1" setuptools==67.8

# Copy requirements first and install
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the code
COPY . .

# Expose port if needed
EXPOSE 5000

# Start the API server
CMD ["python", "apps/api_expose.py"]

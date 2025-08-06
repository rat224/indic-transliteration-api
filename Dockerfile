# Use official Python 3.9 base image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy all project files into the container
COPY . .

# Install system dependencies and fix pip/setuptools versions
RUN apt-get update && \
    apt-get install -y build-essential git && \
    pip install --upgrade pip==23.2.1 setuptools==67.8.0 && \
    pip install -r requirements.txt

# Expose the port used by Flask
EXPOSE 5000

# Start the Flask app
CMD ["python", "app.py"]

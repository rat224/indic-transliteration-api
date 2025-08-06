FROM python:3.9-slim

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
 && apt-get clean

# Downgrade pip to avoid omegaconf and metadata issues
RUN pip install --upgrade "pip<24.1" setuptools wheel

# Copy all project files
COPY . /app

# Install dependencies
RUN pip install -r requirements.txt

# Expose default port
EXPOSE 5000

# Start the API server
CMD ["python", "apps/api_expose.py"]

FROM python:3.9-slim

WORKDIR /app

COPY . .

# Install system dependencies
RUN apt-get update && apt-get install -y build-essential git

# Install safe pip + dependencies
RUN pip install --upgrade pip==23.2.1 setuptools==67.8.0 \
    && pip install -r requirements.txt

EXPOSE 5000

CMD ["python", "app.py"]

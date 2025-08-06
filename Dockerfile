FROM python:3.9-slim

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
 && apt-get clean

RUN pip install --upgrade "pip<24.1" setuptools wheel

COPY . /app

RUN pip install -r requirements.txt

EXPOSE 5000

CMD ["python", "apps/api_expose.py"]

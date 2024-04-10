FROM ubuntu:22.04

WORKDIR /app

RUN apt-get update && \
    apt-get install -y python3 && \
    apt-get install -y python3-pip && \
    apt-get clean

EXPOSE 8080

ENV HOST=localhost PORT=8080

COPY . /app
CMD ["python3", "server.py"]


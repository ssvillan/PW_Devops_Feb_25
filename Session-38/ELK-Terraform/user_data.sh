#!/bin/bash

# Update & install packages
apt-get update -y
apt-get install -y docker.io docker-compose

# Enable Docker service
systemctl enable docker
systemctl start docker

# Create working directory
mkdir -p /opt/elk
cd /opt/elk

# Create docker-compose.yml
cat <<EOF > docker-compose.yml
version: '3'
services:
  elasticsearch:
    image: docker.elastic.co/elasticsearch/elasticsearch:7.17.10
    environment:
      - discovery.type=single-node
      - xpack.security.enabled=false
    ports:
      - "9200:9200"

  logstash:
    image: docker.elastic.co/logstash/logstash:7.17.10
    ports:
      - "5044:5044"

  kibana:
    image: docker.elastic.co/kibana/kibana:7.17.10
    environment:
      - ELASTICSEARCH_HOSTS=http://elasticsearch:9200
    ports:
      - "5601:5601"
EOF

# Start ELK stack
docker-compose up -d

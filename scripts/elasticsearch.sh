#!/bin/sh
echo "########################################################"
echo "Starting elasticsearch"
cd /elasticsearch
./bin/plugin -install mobz/elasticsearch-head
./bin/plugin -install lukas-vlcek/bigdesk
exec /elasticsearch/bin/elasticsearch  -Des.config=/elasticsearch/config/elasticsearch.yml
echo "########################################################"
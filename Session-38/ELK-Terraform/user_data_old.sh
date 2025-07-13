#!/bin/bash
apt-get update
apt-get install -y apt-transport-https curl gnupg openjdk-11-jdk wget

# adding elastic GPG key and repo
#link:

curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elastic.gpg
echo "deb [signed-by=/usr/share/keyrings/elastic.gpg] https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list

apt-get update

#install elastic search
apt install -y elasticsearch
systemctl enable elasticsearch
systemctl start elasticsearch

#install logstash
apt-get install -y logstash
cat <<EOF > /etc/logstash/conf.d/logstash-simple.conf
input{
    tcp{
        port=> 5044
        codec=> json
    }
}
output{
    stdout{}
    elasticsearch{
        hosts=>["http://localhost:9200"]
        index=> "logs"
    }
}
EOF
systemctl enable logstash
systemctl start logstash

#installing KIBANA
apt-get install -y kibana
echo "server.host: \"0.0.0.0\"" >> /etc/kibana/kibana.yml
echo "elasticsearch.hosts:[\"http://localhost:9200\"]" >> /etc/kibana/kibana.yml
systemctl enable kibana
systemctl start kibana
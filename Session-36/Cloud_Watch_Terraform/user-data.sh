#!/bin/bash
yum install -y amazon-cloudwatch-agent

car <<EOF > /opt/aws/amazon-cloudwatch-agent/bin/config.json
{
    "logs":{
        "logs_collected":{
            "file":{
                "collect_list":[
                    {
                        "file_path":"/var/log/messages",
                        "log_group_name":"/ec2/logs",
                        "log_stream_name":"{instance_id}"
                    }
                ]
            }
        }
    }
}
EOF
/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-cli \
-a fetch-config -m ec2 \
-c file:/opt/aws/amazon-cloudwatch-agent/bin/config.json -s
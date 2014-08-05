#!/bin/bash
INSTANCE_ID=$(aws ec2 describe-instances --filters "Name=tag-value,Values='$@'" | grep -o -e 'InstanceId": "[^"]*' | cut -d\" -f3)

echo $INSTANCE_ID

#aws ec2 terminate-instances --instance-ids $INSTANCE_ID

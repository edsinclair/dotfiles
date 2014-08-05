#!/bin/bash
INSTANCE_ID=$(aws ec2 describe-instances --filters "Name=tag-value,Values='$@'" | grep -o -e 'InstanceId": "[^"]*' | cut -d\" -f3)

read -p "Terminate $INSTANCE_ID? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    aws ec2 terminate-instances --instance-ids $INSTANCE_ID
fi

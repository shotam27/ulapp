#!/bin/sh
set -ex

export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
export AWS_DEFAULT_REGION="ap-northeast-1"

export USER_NAME=${USER_NAME}
export HOST_NAME=${HOST_NAME}

MY_SECURITY_GROUP="sg-0584ac2ea4cbb64a6"
MY_IP=`curl -f -s ifconfig.me`

trap "aws ec2 revoke-security-group-ingress --group-id $MY_SECURITY_GROUP --protocol tcp --port 22 --cidr $MY_IP/32" 0 1 2 3 15
aws ec2 authorize-security-group-ingress --group-id $MY_SECURITY_GROUP --protocol tcp --port 22 --cidr $MY_IP/32
ssh $USER_NAME@$HOST_NAME "cd ulapp && git fetch && git pull origin production && docker-compose down && docker-compose up -d"
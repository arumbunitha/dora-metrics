#!/bin/bash

AWS_REGION="ap-southeast-1"

INSTANCE_COUNT=$(aws ec2 describe-instances \
    --region "$AWS_REGION" \
    --filters Name=instance-state-name,Values=running \
    --query "Reservations[*].Instances[*].InstanceId" \
    --output json | jq length)

echo "Number of running EC2 instances in $AWS_REGION = $INSTANCE_COUNT"


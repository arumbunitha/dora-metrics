#!/bin/bash

AWS_REGION="ap-south-1"

INSTANCE_COUNT=$(aws ec2 describe-instances \
    --region "$AWS_REGION" \
    --filters Name=instance-state-name,Values=running \
    --query "Reservations[*].Instances[*].InstanceId" \
    --output json | jq length)

echo "Triggered by n8n $AWS_REGION = $INSTANCE_COUNT"


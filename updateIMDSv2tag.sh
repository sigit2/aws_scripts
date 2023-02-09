#!/usr/bin/env bash

if [ $# -eq 0 ] ; then
    echo "No region specified"
    exit 1
fi

region=$1

for instance in $(aws ec2 describe-instances --query "Reservations[].Instances[].InstanceId" --region $region --output text) ; do
  echo $instance;
  aws ec2 modify-instance-metadata-options \
  --region $region \
  --instance-id $instance \
  --http-tokens required \
  --http-endpoint enabled
done

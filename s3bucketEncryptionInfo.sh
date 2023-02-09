#!/bin/bash

# List encryption settings for all S3 buckets

for bucket_name in $(aws s3api list-buckets --query "Buckets[].Name" --output text); do

    echo ${bucket_name}

    encryption_info=$(aws s3api get-bucket-encryption --bucket ${bucket_name} 2>/dev/null)

    if [[ $? != 0 ]]; then
        echo " - no-encryption"
    else
        echo " - ${encryption_info}"
    fi
done

for bucket in $(aws s3api list-buckets --query "Buckets[].Name" --output text); do
    echo ${bucket}
    aws s3api get-public-access-block --bucket ${bucket}
done

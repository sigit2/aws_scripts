#!/bin/bash
region=eu-west-2

for repo in \
        $(aws ecr describe-repositories --region $region --query "repositories[].[repositoryName]" --output text --no-cli-pager)
do
        echo $repo;
        aws ecr describe-images --repository-name $repo --query 'sort_by(imageDetails,& imagePushedAt)[-1].imageTags[0]' --output text --region $region
done

#!/bin/bash

echo "Start"
read -p "Enter Image ECR Link: " imagerepo
echo "$imagerepo"

read -p "Enter Image Repo Name: " ecr_link
echo "$ecr_link"

docker rmi $imagerepo:latest
echo "step1 image delete done"

docker rmi $ecr_link/$imagerepo:latest
echo "step2 ecr image delete done"

docker build -t $imagerepo .
echo "step3 image build done"

docker tag $imagerepo:latest $ecr_link/$imagerepo:latest
echo "step4 Image tag done "
docker push $ecr_link/$imagerepo:latest
echo "step5 push done"
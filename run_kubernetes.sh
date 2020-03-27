#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=donko/flaskapp

# Step 2
# Run the Docker Hub container with kubernetes

kubectl run prediction-app\
    --image=$dockerpath\
    --port=80 --labels app=prediction-app


# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward prediction-app 8081:80

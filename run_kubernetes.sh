#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub


# Step 1:
# This is your Docker ID/path
dockerpath="riccardopixel/udacity-build-app:v1"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run prediction \
    --image=$dockerpath \
    --port=80 --labels app=prediction

# Step 3:
# List kubernetes pods
kubectl get pods
kubectl wait --for=condition=Ready pod/prediction

# Step 4:
# Forward the container port to a host
kubectl port-forward prediction 8000:80

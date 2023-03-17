#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub


# Step 1:
# This is your Docker ID/path
dockerpath="nginx"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run green-svc \
    --image=$dockerpath \
    --port=80 --namespace udacity --labels app=green-svc

# Step 3:
# List kubernetes pods
kubectl get pods -n udacity
kubectl wait --for=condition=Ready pod/green-svc -n udacity

# Step 4:
# Forward the container port to a host
kubectl port-forward pods/green-svc 8000:80

#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag
# docker build --tag=riccardopixel/green-web-server .
docker build . -t riccardopixel/nginx

# Step 2: 
# List docker images
docker images

# Step 3: 
# Run flask app
# docker run -it -d -p 8000:80 --name web riccardopixel/green-web-server
docker run -it -d -p 8000:80 --name web riccardopixel/nginx
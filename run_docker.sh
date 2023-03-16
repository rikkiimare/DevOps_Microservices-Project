#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag
docker build --tag green-web-server:latest .

# Step 2: 
# List docker images
docker images

# Step 3: 
# Run flask app
docker run -it -d -p 8000:80 --name web green-web-server
#docker run -it -d -p 8080:80 --name web3 -v ~/site-content:/usr/share/nginx/html  nginx
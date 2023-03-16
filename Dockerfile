FROM nginx:latest

# Copy source code to working directory
COPY ./site-content/index.html /usr/share/nginx/html/index.html


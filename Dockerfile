FROM nginx:1.23

# Copy source code to working directory
COPY ./site-content/index.html /usr/share/nginx/html/index.html

#ENTRYPOINT [ "/bin/bash", "-l", "-c" ]
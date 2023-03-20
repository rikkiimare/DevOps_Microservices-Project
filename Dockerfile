FROM nginx:1.23

# Copy source code to working directory
XCOPY ./site-content/index.html /usr/share/nginx/html/index.html

#ENTRYPOINT [ "/bin/bash", "-l", "-c" ]
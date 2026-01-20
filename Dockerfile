# Minimal and secure base image
FROM nginx:alpine

# Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy our static website
COPY index.html /usr/share/nginx/html/

# Expose container port
EXPOSE 80

# Run nginx in foreground
CMD ["nginx", "-g", "daemon off;"]


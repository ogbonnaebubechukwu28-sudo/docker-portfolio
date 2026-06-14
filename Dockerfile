# Use official Nginx base image
FROM nginx:latest

# Remove default Nginx welcome page
RUN rm -rf /usr/share/nginx/html/*

# Copy our custom HTML portfolio into the Nginx web directory
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80

# Start Nginx when container runs
CMD ["nginx", "-g", "daemon off;"]
# Use the official NGINX image as base
FROM nginx:alpine

# Remove the default nginx index page
RUN rm -rf /usr/share/nginx/html/*

# Copy custom Nginx config
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

# Copy your static files (index.html and assets) to nginx's web root ###
COPY index.html /usr/share/nginx/html/
COPY assets/ /usr/share/nginx/html/assets/

# Expose port 80
EXPOSE 80

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]

# Use an official Node.js runtime as a parent image
FROM nginx

# Set the working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json to /app
EXPOSE 80

# Commande de démarrage NGINX
CMD ["nginx", "-g", "daemon off;"]

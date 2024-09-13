# Stage 1: Build the Angular application
# FROM node:20 AS build

# WORKDIR /app
# RUN ls -al
# COPY package*.json /app/
# RUN npm install
    #--legacy-peer-deps
#COPY . /app/
#RUN npm run build

# Stage 2: Create the Nginx server
FROM nginx:alpine

RUN ls -al
# Copy the Angular build from the build stage to the Nginx server
# COPY --from=build /app/dist /var/www/html

# (Optional) Replace the default Nginx configuration with your own custom configuration
# COPY frontend.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

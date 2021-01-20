#Base Image
FROM nginx:1.19-alpine

#Copy index.html to the container
COPY index.html /usr/share/nginx/html

#Expose port 8080
EXPOSE 8080

#Execute NGINX at port 8080
CMD ["/bin/sh", "-c", "sed -i 's/listen  .*/listen 8080;/g' /etc/nginx/conf.d/default.conf && exec nginx -g 'daemon off;'"]

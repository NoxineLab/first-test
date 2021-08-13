FROM nginx
COPY static-html-directory /usr/share/nginx/html
docker run --name some-nginx -d some-content-nginx
EXPOSE 80

DOCKERFILE (END)

FROM nginx:latst
Run sed -i 's/ngix/g' /user/shre/nginx/html/index.html
EXPOSE 80

DOCKERFILE (END)

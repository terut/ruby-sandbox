FROM nginx:alpine
MAINTAINER terut

COPY nginx.conf /etc/nginx/nginx.conf
COPY proxy.conf /etc/nginx/conf.d/default.conf
COPY react.html /usr/share/nginx/html/react.html
COPY vue.html /usr/share/nginx/html/vue.html

CMD ["nginx", "-g", "daemon off;"]

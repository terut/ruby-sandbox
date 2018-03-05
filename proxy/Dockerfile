FROM nginx:alpine
MAINTAINER terut

COPY nginx.conf /etc/nginx/nginx.conf
COPY proxy.conf /etc/nginx/conf.d/default.conf
COPY react/index.html /usr/share/nginx/html/react.html
COPY react/dist/react-bundle.js /usr/share/nginx/html/react-bundle.js

CMD ["nginx", "-g", "daemon off;"]

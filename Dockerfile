FROM node
WORKDIR /dhonu
COPY . .
RUN npm install
RUN npm run build
FROM nginx:stable-alpine3.20-perl
COPY --from=0 dhonu/build/ /usr/share/nginx/html/
CMD ["nginx","-g","daemon off;"]
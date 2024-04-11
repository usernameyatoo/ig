FROM nikolaik/python-nodejs:python3.9-nodejs18
WORKDIR /app
COPY . ./
RUN yarn install
RUN yarn run build
FROM nginx:alpine
COPY docker/nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]


FROM nikolaik/python-nodejs:python3.9-nodejs18
RUN npm i
CMD npm run dev

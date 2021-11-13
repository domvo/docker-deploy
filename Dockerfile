FROM node:lts-alpine
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build


FROM nginx:stable-alpine
COPY --from=0 /app/dist /usr/share/nginx/html
COPY default.conf /etc/nginx/conf.d/default.conf
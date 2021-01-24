FROM node:alpine

WORKDIR /var/node/app

COPY package*.json ./

RUN npm install

COPY . .

CMD ["npm", "run", "build"]

FROM nginx

COPY --from=0 /var/node/app/build /usr/share/nginx/html

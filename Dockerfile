FROM node:12
WORKDIR /nodejapp
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD [ "node","server.js" ]

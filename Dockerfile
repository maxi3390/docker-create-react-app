FROM node:16-alpine

RUN apk update && apk add git

WORKDIR /app

COPY ./ .

RUN npm install

EXPOSE 3000

CMD ["npm", "start"]

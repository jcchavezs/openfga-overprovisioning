FROM node:18-alpine

WORKDIR /usr/app/fga-drive-example

COPY . . 

RUN npm install

ENTRYPOINT ["npm"]

EXPOSE 3000

CMD ["run", "dev"]
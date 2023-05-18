#Primera Etapa
FROM node:10-alpine as build-step

RUN mkdir -p /app

WORKDIR /app

#COPY entrypoint.sh /entrypoint.sh
#RUN chmod +x /entrypoint.sh
#ENTRYPOINT [ "/entrypoint.sh"  ]

COPY /package.json /app

RUN npm install

COPY . /app

RUN npm run build --prod

FROM alpine:latest

#Segunda Etapa
FROM nginx:1.17.1-alpine
#Si estas utilizando otra aplicacion cambia PokeApp por el nombre de tu app
COPY --from=build-step /app/dist/PokeApp /usr/share/nginx/html

# -- BUILD --
FROM node:12.13.0-alpine as build

WORKDIR /usr/src/app

COPY package* ./
COPY . .

RUN yarn install
RUN yarn build

# -- RELEASE --
FROM nginx:stable-alpine as release

COPY --from=build /usr/src/app/build /usr/share/nginx/html
# copy .env.example as .env to the relase build
COPY --from=build /usr/src/app/.env.example /usr/share/nginx/html/.env
COPY --from=build /usr/src/app/nginx/default.conf /etc/nginx/conf.d/default.conf

RUN apk add --update nodejs
RUN apk add --update yarn
RUN yarn global add runtime-env-cra@0.2.0

WORKDIR /usr/share/nginx/html

EXPOSE 80

CMD ["/bin/sh", "-c", "runtime-env-cra && nginx -g \"daemon off;\""]
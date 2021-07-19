FROM node:16-alpine3.14

RUN apk update && apk upgrade && apk add --no-cache git

RUN yarn global add @vue-storefront/cli

# GIT
RUN apk update && apk upgrade && apk add --no-cache git

# Vue Storefront | VSF needs this
RUN yarn global add @vue-storefront/cli

# Python | Scandipwa needs this
RUN apk add --update python3 py3-pip && ln -sf python3 /usr/bin/python

USER node

EXPOSE 3000
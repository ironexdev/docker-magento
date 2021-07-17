FROM node:16-alpine3.14

ARG GROUP_ID
ARG USER_ID

RUN apk update && apk upgrade && apk add --no-cache git

RUN yarn global add @vue-storefront/cli

RUN addgroup -g $GROUP_ID -S dockeruser

RUN adduser -S -G dockeruser -u $USER_ID -s /bin/ash dockeruser

# GIT
RUN apk update && apk upgrade && apk add --no-cache git

# Vue Storefront | VSF needs this
RUN yarn global add @vue-storefront/cli

# Python | Scandipwa needs this
RUN apk add --update python3 py3-pip && ln -sf python3 /usr/bin/python

USER dockeruser

EXPOSE 3000
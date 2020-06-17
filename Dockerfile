FROM node:14-alpine
WORKDIR /srv/app

COPY . /srv/app
RUN yarn --frozen-lockfile --production=true
CMD [ "node", "index.js" ]

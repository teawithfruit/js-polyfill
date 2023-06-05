FROM node:12.22.10-alpine

RUN apk add --no-cache --update bash
RUN apk add --no-cache --update --virtual build git python2 make gcc g++ tzdata
WORKDIR /polyfill
ARG POLYFILL_TAG='v4.50.1'
ARG NODE_ENV='production'
RUN \
  git clone https://github.com/Financial-Times/polyfill-service . && \
  git checkout ${POLYFILL_TAG} && \
  rm -rf .git && \
  yarn install && \
  yarn add semver && \
  sed -i.bak -e 's,^node,exec node,' start_server.sh && \
  mv start_server.sh /bin/ && \
  chmod a+x /bin/start_server.sh && \
  apk del build
ENV PORT 8801

EXPOSE ${PORT}

CMD ["/bin/start_server.sh", "server/index.js"]

FROM node:20.18.0-alpine

RUN apk add --no-cache --update bash
RUN apk add --no-cache --update --virtual build git python3 make gcc g++ tzdata
WORKDIR /polyfill
ARG POLYFILL_TAG='v4.57.0'
ARG NODE_ENV='production'
RUN \
  git clone https://github.com/polyfillpolyfill/polyfill-service . && \
  git checkout ${POLYFILL_TAG} && \
  rm -rf .git && \
  npm install && \
  npm build && \
  apk del build
ENV PORT 8801

EXPOSE ${PORT}

CMD ["/bin/start_server.sh", "server/index.js"]

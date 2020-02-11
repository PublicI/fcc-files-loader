FROM publicintegrity/loader

# https://github.com/nodejs/docker-node/blob/master/6/onbuild/Dockerfile
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

#ARG NODE_ENV
#ENV NODE_ENV $NODE_ENV
COPY . /usr/src/app
#cRUN npm ci && npm cache clean --force

CMD ["./transforms/list.sh"]

#FROM node:alpine
#NodeJS Image with Python3
FROM nikolaik/python-nodejs:python3.11-nodejs16

WORKDIR /app

COPY . .

#RUN npm install --legacy-peer-deps
RUN npm install

ENV NPM_CONFIG_LOGLEVEL warn
ENV PATH /app/node_modules/.bin:$PATH

RUN npm run build --production

RUN npm install -g serve

CMD serve -s build -l 3015

EXPOSE 3015

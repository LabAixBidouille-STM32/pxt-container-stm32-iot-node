FROM node:9-slim

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=${NPM_CONFIG_PREFIX}/bin/:${PATH}
ARG GIT_URL="https://github.com/LabAixBidouille-STM32/pxt-stm32-iot-node.git"
ARG GIT_COMMIT="HEAD"
WORKDIR /usr/src/makecode

RUN printf "deb http://httpredir.debian.org/debian jessie-backports main non-free\ndeb-src http://httpredir.debian.org/debian jessie-backports main non-free" > /etc/apt/sources.list.d/backports.list


RUN apt-get update &&\ 
apt-get -t jessie-backports install -y cmake &&\
apt-get install -y \
gcc-arm-none-eabi \
git \
jq \ 
python\
&&\
npm install -g pxt

RUN git clone ${GIT_URL} 

WORKDIR pxt-stm32-iot-node/

RUN git checkout ${GIT_COMMIT} &&\
 npm install

EXPOSE 3232 3233

CMD pxt serve -h "0.0.0.0" --noBrowser --cloud -w 3233 -p 3232

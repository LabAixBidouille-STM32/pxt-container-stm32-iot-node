FROM node:9-stretch

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=${NPM_CONFIG_PREFIX}/bin/:${PATH}
ENV GIT_URL="https://github.com/LabAixBidouille-STM32/pxt-stm32-iot-node.git"
WORKDIR /usr/src/makecode


RUN apt-get update &&\ 
apt-get install -y \
cmake \
gcc-arm-none-eabi \
jq \ 
python2.7\
&&\
npm install -g pxt

RUN git clone ${GIT_URL} 

WORKDIR pxt-stm32-iot-node/

RUN curl -s 'https://api.github.com/repos/LabAixBidouille-STM32/pxt-stm32-iot-node/releases/latest'| jq '.tag_name' | xargs git checkout  &&\
 npm install && \
 pxt buildtarget

EXPOSE 3232 3233

CMD pxt serve -h "0.0.0.0" --noBrowser --cloud -w 3233 -p 3232
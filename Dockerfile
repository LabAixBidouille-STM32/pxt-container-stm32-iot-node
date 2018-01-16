FROM node:9-stretch

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=${NPM_CONFIG_PREFIX}/bin/:${PATH}

WORKDIR /usr/src/makecode

RUN npm install -g jake

COPY pxt ./pxt
RUN cd pxt && npm install && jake

COPY pxt-common-packages ./pxt-common-packages
RUN cd pxt-common-packages && \
 npm install && \
 npm link ../pxt

COPY pxt-stm32-iot-node ./pxt-stm32-iot-node
RUN cd pxt-stm32-iot-node && \
 npm install && \
 npm link ../pxt && \
 npm link ../pxt-common-packages

WORKDIR pxt-stm32-iot-node/

RUN npm install -g pxt

EXPOSE 3232 3233

CMD pxt serve -h "0.0.0.0" --noBrowser --cloud -w 3233 -p 3232

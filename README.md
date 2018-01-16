# Conteneur docker pour le développement de la cible STM32 IoT Node de Makecode
Le dévelopement avec le framework `PXT` demande un grand nombre de dépendances. Ce dépot permet de 
créer un environement complet et directement fonctionnel sans perdre trop de temps.

Pour avoir un environement de dev sur votre machine, il vous suffit de suivre les quelques étapes ci-dessous :
1. Cloner le dépot et ses sous-modules :
 ```sh
 $ git clone --recurse-submodules https://github.com/LabAixBidouille-STM32/pxt-container-stm32-iot-node
 ``` 
2. Construire le conteneur :
 ```sh
 $ docker build --rm -f Dockerfile -t LabAixBidouille-STM32/pxt-container-stm32-iot-node:latest .
 ```
3. Le lancer : 
 ```sh
 $ docker run -p3232:3232 -p3233:3233 -it --name pxt-stm32-iot-node01 -d LabAixBidouille-STM32/pxt-container-stm32-iot-node:latest /bin/bash
 $ docker attach pxt-stm32-iot-node01
 root@eb08ef99cb38# pxt serve -h "0.0.0.0" --noBrowser --cloud -w 3233 -p 3232
 ```
4. Ouvrir le navigateur :
 ```
 http://localhost:3232/
 ```



## image============================== de base pour les instructions suivantes
FROM ubuntu

RUN apt-get update && apt-get install --yes software-properties-common && add-apt-repositor$

RUN apt update && apt install golang-go --yes

RUN apt-get install --yes software-properties-common

RUN add-apt-repository -y ppa:ethereum/ethereum
RUN apt install ethereum --yes

RUN apt-get update && apt-get install solc --yes

COPY ./genesis.json ./genesis.json

COPY ./HelloWorld.sol ./HelloWorld.sol

RUN geth init genesis.json

RUN solc HelloWorld.sol --bin --abi

RUN geth --ropsten --syncmode "fast" console

ENTRYPOINT ["geth","console"]

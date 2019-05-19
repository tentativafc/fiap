# Exercícios 3. Arquitetura de dados

## Comandos

### Pré requisitos Linux
```sh
sudo apt install mongo-tools
sudo apt install mongodb-clients
```

### Preparação do ambiente docker
```sh
docker run -d -p 27017:27017 -p 28017:28017 -e AUTH=no tutum/mongodb:3.0
```

### Importação dos dados
```sh
mongoimport -h 127.0.0.1:27017 -d cartola -c jogadores --type csv --file data/2018_jogadores.csv --headerline
mongoimport -h 127.0.0.1:27017 -d cartola -c partidas --type csv --file data/2018_partidas.csv --headerline
mongoimport -h 127.0.0.1:27017 -d cartola -c medias --type csv --file data/2018-medias-jogadores.csv --headerline
```

### Sandobox
```sh
mongo --host 127.0.0.1 --port 27017

use cartola
db.collections
```

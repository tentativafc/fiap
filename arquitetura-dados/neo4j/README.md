### Criando ambiente

```sh
docker run --publish=7474:7474 --publish=7687:7687 --volume=/home/marcelo/Documentos/Ambiente/Projects/Fiap/fiap/arquitetura-dados/neo4j/data:/data --volume=/home/marcelo/Documentos/Ambiente/Projects/Fiap/fiap/arquitetura-dados/neo4j/import:/import neo4j:3.5.5
```

### Modelo

![](modelo.png?raw=true)

### Importando os dados


Importação das partidas

```sh
MATCH(n) DETACH DELETE n
```


```sh
LOAD CSV WITH HEADERS FROM 'file:///matches.csv' AS line
MERGE (c:CopaDoMundo {nome: line.world_cup})-[:REALIZADA_EM]->(a:Ano {ano:toInteger(line.year)})
MERGE (p:Partida {id: line.id, placar_time_casa: toInteger(line.h_score), placar_time_visitante: toInteger(line.a_score), publico: line.attendance, data:line.date})
MERGE (e:Estadio {nome: line.stadium})
MERGE (f:Fase {nome: line.phase})
MERGE (time_casa:Pais {nome: line.home})
MERGE (time_visitante:Pais {nome: line.away})
MERGE (c)-[:COMPOSTA_POR]->(p)
MERGE (p)-[:DISPUTADA_NO]->(e)
MERGE (p)-[:NA_FASE]->(f)
MERGE (p)-[:TIME_DA_CASA]->(time_casa)
MERGE (p)-[:TIME_VISITANTE]->(time_visitante)
MERGE (c)-[:ORGANIZADA_POR]->(pais_realizador)
MERGE (time_casa)-[:JOGOU_EM]->(p)
MERGE (time_visitante)-[:JOGOU_EM]->(p)

MATCH (c:CopaDoMundo)-[rel:COMPOSTA_POR]->(p:Partida) RETURN c, rel, p
```

```sh
USING PERIODIC COMMIT 500
LOAD CSV WITH HEADERS FROM 'file:///squads.csv' AS line
MATCH (c:CopaDoMundo)-[rel:REALIZADA_EM]->(a:Ano {ano: toInteger(line.year)})

MERGE (j:Jogador{id: line.player_id, nome: line.player_name})
MERGE (s:Selecao{nome: line.country, ano: toInteger(line.year)})
MERGE (p:Pais{nome: line.country})
MERGE (p)-[:CONVOCOU]->(s)
MERGE (j)-[:JOGOU_POR]->(s)
MERGE (s)-[:PARA_A_COPA]->(c)

MATCH (s:Selecao)-[rel:PARA_A_COPA]->(c:CopaDoMundo) RETURN s, rel, c
```

```sh
USING PERIODIC COMMIT 500
LOAD CSV WITH HEADERS FROM 'file:///lineups.csv' AS line
MATCH (j:Jogador {id: line.player_id})
MATCH (p:Partida {id: line.match_id})

FOREACH (gol in CASE WHEN line.type IN ['starting'] THEN [1] ELSE [] END | 
   MERGE (e:Estatistica)-[:NA_PARTIDA]->(p)
   MERGE (j)-[:TITULAR]->(e)
)

FOREACH (gol in CASE WHEN line.type IN ['sub'] THEN [1] ELSE [] END | 
   MERGE (e:Estatistica)-[:NA_PARTIDA]->(p)
   MERGE (j)-[:RESERVA]->(e)
)

MATCH (e:Estatistica)-[rel:NA_PARTIDA]->(p:Partida) RETURN e, rel, p
```

```sh
USING PERIODIC COMMIT 500
LOAD CSV WITH HEADERS FROM 'file:///events.csv' AS line
MATCH (j:Jogador {id: line.player_id})
MATCH (p:Partida {id: line.match_id})
MATCH (e:Estatistica)<-[:TITULAR|:RESERVA]-(j)

FOREACH (gol in CASE WHEN line.type IN ['penalty', 'goal', 'owngoal'] THEN [1] ELSE [] END | 
   MERGE (g:Gol{tipo: line.type, tempo: toInteger(line.time)})<-[:MARCOU_UM_GOL]-(e)
)

FOREACH (cartao in CASE WHEN line.type IN ['red', 'yellow'] THEN [1] ELSE [] END | 
   MERGE (c:Cartao{tipo: line.type, tempo: toInteger(line.time)})<-[:RECEBEU_CARTAO]-(e)
)

MATCH (e:Estatistica)-[rel:MARCOU_UM_GOL]->(g:Gol) RETURN e, rel, g
MATCH (e:Estatistica)-[rel:RECEBEU_CARTAO]->(c:Cartao) RETURN e, rel, c
```


CREATE (m:Match { h_score: line.h_score, stadium: line.stadium})

LOAD CSV WITH HEADERS FROM 'file:///squads.csv' AS line
CREATE (s:Squad { year: line.year, player_id: line.player_id, player_name: line.player_name})
```

### Questões:

1. Estádios com mais gols

2. Jogadores que participaram em mais do que uma copa

























WITH split(line.host, '/') as splitted_country
UNWIND range(0, size(splitted_country) -1) as i
MERGE (pais_realizador:Pais {nome: splitted_country[i]})
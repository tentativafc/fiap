// 1. 
var player_ids = db.medias.find({},{player_id:1}).sort({G_mean:-1}).limit(10).map((doc)=> doc.player_id);
db.jogadores.find({"atletas.atleta_id":{$in:player_ids}}, {"atletas.apelido": 1, "atletas.clube.id.full.name": 1, "atletas.posicao_id": 1}).map((doc) => {return {nome: doc.atletas.apelido, posicao: doc.atletas.posicao_id, clube: doc.atletas.clube.id.full.name}});

// 2.
var time = "Internacional - RS";
db.partidas.find({$or:[{away_team:time},{home_team:time}]},{_id: 0, date: 1}).pretty();

// 3.
db.medias.find({player_position:"gol"}, {player_nickname: 1, DD_mean: 1}).sort({DD_mean:-1}).limit(1).pretty();

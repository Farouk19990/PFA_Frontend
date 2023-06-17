import 'package:mall/model/client.dart';

import 'article.dart';
import 'command.dart';

class LigneCommand {
  final int id;
  final int prix;
  final int qteT;
  final Article article;
  final Command command;
  //final Client clientId;
  LigneCommand({
    required this.id,
    required this.prix,
    required this.qteT,
    required this.article,
    required this.command
    //required this.clientId,
  });
  factory LigneCommand.fromjson(Map<String, dynamic> json) {
    return LigneCommand(
      id: json['id'],
      prix: json['prix'],
      qteT: json['quantite'],
      article:Article.fromjson( json['article']),
      command:Command.fromjson( json['commande'])

      //clientId: Client.fromjson(json['client']),
    );
  }
}

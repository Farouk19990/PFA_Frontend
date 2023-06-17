import 'dart:convert';

import 'package:mall/model/article.dart';
import 'package:mall/model/inBag.dart';
import 'package:mall/repository/ligne_command_API.dart';
import 'package:mall/view/static/static.dart';
import 'package:http/http.dart' as http;

import '../model/ligneCommand.dart';

class LigneCommandRepo extends LigneCommandAPI {
  @override
  ligneCommand(String commandID) async {
    List<InBag> lignes = MyStatic.inBagList;
    print("lignes " + lignes.first.toString());
    for (InBag i in lignes) {
      print("TOO BD == " + i.toString());
      var json = jsonEncode(<String, dynamic>{
        "prix": i.price,
        "quantite": i.qte,
        "commande": int.parse(commandID),
        "article": i.id
      });
      lignes = MyStatic.inBagList = [];
      await http.post(
        Uri.parse(lignCommandUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json,
      );
    }
    /*     var json = jsonEncode(<String, dynamic>{
      'email': email,
      'login': login,
      'password': password,
      'role': 1
    });
    await http.post(
      Uri.parse('$authUrl/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json,
    ); */
  }

  @override
  Future<List<LigneCommand>> getArticleByLigneCommandID(int commandID) async {
    List<LigneCommand> listCommand = [];
    var json = jsonEncode(<String, dynamic>{"commande": commandID});
    final response = await http.post(
      Uri.parse('$lignCommandUrl/getlignebyCommande'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json,
    );
    var dataList = jsonDecode(response.body) as List;
    print(dataList);
    listCommand=dataList.map((e) => LigneCommand.fromjson(e)).toList();

    return listCommand;
  }
}

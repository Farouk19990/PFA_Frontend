import 'dart:convert';
import 'dart:math';

import 'package:mall/model/command.dart';
import 'package:http/http.dart' as http;
import 'command_API.dart';

class CommandRepository extends CommandAPI {
  @override
  Future<List<Command>> getAllCommand() async {
    List<Command> listOfOrders = [];
    final response = await http.get(Uri.parse(commandUrl));
    var dataList = jsonDecode(response.body) as List;
    listOfOrders =
        dataList.map((command) => Command.fromjson(command)).toList();
    print("commandRepository");
    return listOfOrders;
  }

  String generateRandomString(int len) {
    var r = Random();
    const allChars = 'AaBbCcDdlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1EeFfGgHhIiJjKkL';
    final randomString =
        List.generate(len, (index) => allChars[r.nextInt(allChars.length)])
            .join();
    return randomString;
  }

  @override
   passerCommand(int prixT, int qteT, int clientID) async {
    List<Command> list = await getAllCommand();
    final now = DateTime.now();
    String date = "${now.day}-${now.month}-${now.year}";
    List<String> listOfRef = list
        .map(
          (e) => e.reference,
        )
        .toList();
    String ref = generateRandomString(8).toUpperCase();
    print('ref: ' + ref);
    while (listOfRef.contains(ref)) {
      ref = generateRandomString(8);
    }
    var json = jsonEncode(<String, dynamic>{
      "prixTotal": prixT,
      "qteTotal": qteT,
      "reference": ref,
      "date": date,
      "client": clientID
    });
    print("jsooo $json");
    final response = await http.post(
      Uri.parse(commandUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json,
    );
    var datalist = jsonDecode(response.body);
    return datalist['id'].toString();
  }
}

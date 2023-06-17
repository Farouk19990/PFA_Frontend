import 'dart:convert';
import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:http/http.dart' as http;
import 'package:mall/repository/client_API.dart';
import 'package:mall/view/static/static.dart';

import '../model/client.dart';
import '../model/command.dart';

class ClientRepository extends ClientAPI {
  @override
  Future<List<Client>> getAll() async {
    List<Client> listOfClient = [];
    //print("clientRepository");
    Cookie('jwt', MyStatic.staticT);
    var head = <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${MyStatic.staticT}'
    };
    final response = await http.get(Uri.parse(clientUrl), headers: head);
    var dataList = jsonDecode(response.body) as List;
    print('response: ${response.body}');

    listOfClient = dataList.map((client) => Client.fromjson(client)).toList();
    return listOfClient;
  }

  @override
  Future<List<Client>> getClientByEmail(String email) async {
    List<Client> listOfClient = await getAll();
    print("clienstsss : ${listOfClient}");
    return listOfClient.where((element) => element.email == email).toList();
  }

  @override
  Future<List<Command>> getClientCommand(int id) async {
    List<Command> listOfOrders = [];
    final response = await http.get(Uri.parse('$clientUrl/$id'));
    print("Client command :: ${response.body}");
    print('$clientUrl/$id');
    var dataList = jsonDecode(response.body);
    var data=dataList[0]['commandes'] as List;
    listOfOrders =
        data.map((command) => Command.fromjson(command)).toList(); 
    print('command ${listOfOrders}');
    //var dataList = jsonDecode(response.body) as List;
    /* listOfOrders =
        dataList.map((command) => Command.fromjson(command)).toList(); */

    print("commandRepository");
    return listOfOrders;
  }
}

import 'package:mall/model/user.dart';

import 'UserC.dart';

class Client {
  final int id;
  final String name;
  final String email;
  final String adresse;
  //final int photo;
  //final String dateNaiss;
  Client({
    required this.id,
    required this.name,
    required this.email,
    required this.adresse,
    //required this.photo,
    //required this.dateNaiss,
  });
  factory Client.fromjson(Map<String, dynamic> json) {
    return Client(
      id: json['id'],
      name: json['name'] ?? "name",
      email: json['email'],
      adresse: json['adresse'] ?? "adresseNull",
      //photo: json['photo'],
      //dateNaiss: json['dateNaiss'],
    );
  }
}

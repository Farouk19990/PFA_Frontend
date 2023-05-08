import 'dart:convert';

import 'package:mall/model/user.dart';

class Boutique {
  final int id;
  final String name;
  final String email;
  final String adresse;
  final String logo;
  final String image;
  //final String latitude;
  //final String longitude;
  final String siteweb;
  final String user;
  Boutique(
      {required this.id,
      required this.name,
      required this.email,
      required this.adresse,
      required this.logo,
      required this.image,
      //required this.latitude,
      //required this.longitude,
      required this.siteweb,
      required this.user
      });
  factory Boutique.fromjson(Map<String, dynamic> json) {
    return Boutique(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        adresse: json['adresse'],
        logo: json['logo'],
        image: json['image'],
        //latitude: json['latitude'],
        //longitude: json['longitude'],
        siteweb: json['site_web'],
        user: jsonEncode(json['utilisateur']) ,
        );
  }
}

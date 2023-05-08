import 'dart:convert';

import 'package:mall/model/article.dart';
import 'package:mall/model/boutique.dart';
import 'package:mall/model/categorie.dart';
import 'package:mall/model/sous_categorie.dart';
class Produit {
  final int id;
  final String name;
  final String reference;
  final String image;
  final String description;
  //final String video;
  final int prix;
  final SousCategorie sousCategorie;
  final String articles;
  final Boutique? boutique;
  Produit(
      {required this.id,
      required this.name,
      required this.reference,
      required this.image,
      required this.description,
      //required this.video,
      required this.prix,
      required this.sousCategorie,
      required this.articles,
      required this.boutique,
      });
  factory Produit.fromjson(Map<String, dynamic> json) {
    return Produit(
        id: json['id'],
        name: json['name'],
        reference: json['reference'],
        description: json['description'],
        //video: json['video'],
        image: json['image'],
        prix: json['prix'],
        articles: jsonEncode(json['articles']),
        sousCategorie: SousCategorie.fromjson(json['souscategorie']),
        boutique: Boutique.fromjson(json['boutique']),
        );
  }
}
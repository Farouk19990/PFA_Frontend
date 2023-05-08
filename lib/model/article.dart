import 'package:mall/model/couleur.dart';
import 'package:mall/model/produit_article.dart';
import 'package:mall/model/taille.dart';

class Article {
  final int id;
  final int qteStk;
  final int qteMin;
  final ProduitArticle produitA;
  final String image;
  final Couleur couleur;
  final Taille taille;
  Article(
      {required this.id,
      required this.qteStk,
      required this.qteMin,
      required this.produitA,
      required this.image,
      required this.taille,
      required this.couleur,
      });
  factory Article.fromjson(Map<String, dynamic> json) {
    return Article(
        id: json['id'],
        qteStk: json['qteStk'],
        qteMin: json['qteMin'],
        produitA: ProduitArticle.fromjson(json['produit']),
        image: json['image'],
        taille: Taille.fromjson(json['taille']),
        couleur:Couleur.fromjson(json['couleur'])
        );
  }
}
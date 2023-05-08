import 'categorie.dart';

class SousCategorie {
  final int id;
  final String name;
  final Categorie categorie;

  SousCategorie({
    required this.id,
    required this.name,
    required this.categorie,
  });
  factory SousCategorie.fromjson(Map<String, dynamic> json) {
    return SousCategorie(
      id: json['id'],
      name: json['name'],
      categorie: Categorie.fromjson(json['categorie']),
    );
  }
}

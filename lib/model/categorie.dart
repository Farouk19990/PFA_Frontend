class Categorie {
  final int id;
  final String name;
  Categorie(
      {required this.id,
      required this.name,
      });
  factory Categorie.fromjson(Map<String, dynamic> json) {
    return Categorie(
        id: json['id'],
        name: json['name'],
        );
  }
}
class Couleur {
  final int id;
  final String name;
  Couleur(
      {required this.id,
      required this.name,
      });
  factory Couleur.fromjson(Map<String, dynamic> json) {
    return Couleur(
        id: json['id'],
        name: json['name'],
        );
  }
}
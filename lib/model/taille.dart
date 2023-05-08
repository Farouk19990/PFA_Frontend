class Taille {
  final int id;
  final String name;
  Taille({
    required this.id,
    required this.name,
  });
  factory Taille.fromjson(Map<String, dynamic> json) {
    return Taille(
      id: json['id'],
      name: json['name'],
    );
  }
}

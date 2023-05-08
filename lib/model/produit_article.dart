class ProduitArticle {
  final int id;
  final String name;
  final String reference;
  final String image;
  final String description;
  //final String video;
  final int prix;
  ProduitArticle(
      {required this.id,
      required this.name,
      required this.reference,
      required this.image,
      required this.description,
      //required this.video,
      required this.prix,
      });
  factory ProduitArticle.fromjson(Map<String, dynamic> json) {
    return ProduitArticle(
        id: json['id'],
        name: json['name'],
        reference: json['reference'],
        description: json['description'],
        //video: json['video'],
        image: json['image'],
        prix: json['prix'],
        );
  }
}
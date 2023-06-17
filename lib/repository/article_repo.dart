import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mall/model/article.dart';

import 'article_API.dart';

class ArticleRepository extends ArticleAPI {
  @override
  Future<List<Article>> getArticlesByProductId(int id) async {
    List<Article> listOfArticles = [];
    final response =
        await http.get(Uri.parse(articleUrl + '/by-product-id/$id'));
    var dataList = jsonDecode(response.body) as List;
    listOfArticles =
        dataList.map((article) => Article.fromjson(article)).toList();
    return listOfArticles;
  }
  @override
  Future<Article> getbyProduitbyTaillebyCouleur(
      int id, String size, String couleur) async {
        print("id = ${id}  size " + size + " couleur = " +couleur);
    var json = jsonEncode(
        <String, dynamic>{"produit": id, "taille": size, "couleur": couleur});
    final response = await http.post(
      Uri.parse('$articleUrl/getbyProduitbyTaillebyCouleur'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json,
    );
    
print("boddy ${response.statusCode}");
List<Article> listOfArticles = [];
    var dataList = jsonDecode(response.body) as List;
    listOfArticles =
        dataList.map((article) => Article.fromjson(article)).toList(); 

    return listOfArticles.first;
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mall/model/article.dart';

import 'article_API.dart';


class ArticleRepository extends ArticleAPI {
  @override
  Future<List<Article>> getArticlesByProductId(int id) async {
    List<Article> listOfArticles = [];
    final response = await http.get(Uri.parse(articleUrl+'/by-product-id/$id'));
    var dataList = jsonDecode(response.body) as List;
    listOfArticles =
        dataList.map((article) => Article.fromjson(article)).toList();
    return listOfArticles;
  }

}
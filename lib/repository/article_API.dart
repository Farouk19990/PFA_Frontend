import '../model/article.dart';

abstract class ArticleAPI{
  String articleUrl = "http://192.168.1.15:3000/articles";

  Future<List<Article>> getArticlesByProductId(int ProductId);
  Future<Article> getbyProduitbyTaillebyCouleur(int id,String size,String couleur);
}
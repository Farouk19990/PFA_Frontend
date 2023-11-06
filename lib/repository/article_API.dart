import '../model/article.dart';

abstract class ArticleAPI{
  String articleUrl = "http://10.10.17.102:3000/articles";

  Future<List<Article>> getArticlesByProductId(int ProductId);
  Future<int> getbyProduitbyTaillebyCouleur(int id,String size,String couleur);
}
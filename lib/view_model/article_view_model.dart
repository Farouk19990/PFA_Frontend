import 'package:mall/repository/produit_repo.dart';
import 'package:mall/view/static/static.dart';

import '../model/article.dart';
import '../repository/article_repo.dart';

class ArticleVM {
  final ArticleRepository articleRepository;
  ArticleVM({
    required this.articleRepository,
  });
  Future<List<Article>> getArticlesByProductId(int id) async {
    List<Article> articles = [];
    articles = await articleRepository.getArticlesByProductId(id);
    print(articles);
    return articles;
  }

  Future<List<List<String>>> getArticlesColorsAndSizes(int id) async {
    List<Article> articles = [];
    List<String> colorsName = [];
    List<String> sizesName = [];
    List<List<String>> ColorsAndSize = [];
    articles = await articleRepository.getArticlesByProductId(id);

    colorsName = articles.map((e) => e.couleur.name).toSet().toList();

    sizesName = articles.map((e) => e.taille.name).toSet().toList();
    ColorsAndSize.add(colorsName);
    ColorsAndSize.add(sizesName);
    return ColorsAndSize;
  }

  Future<List<Article>> getArticles() async {
    List<Article> articles = [];
    List<Article> list = [];
    for (var i in MyStatic.listOfProductID) {
      list = await articleRepository.getArticlesByProductId(i);
      articles.addAll(list);
    }
    print(articles.map((e) => e.produitA.prix).toList().toSet().toList());
    return articles;
  }

  Future<List<int>> getPrices() async {
    List<Article> articles = await getArticles();
    List<int> prices =
        articles.map((e) => e.produitA.prix).toList().toSet().toList();
    prices.sort();
    return prices;
  }

  Future<int> getArticlesIdByCouleurTaille(
      int id, String size, String color) async {
    int articleId =
        await articleRepository.getbyProduitbyTaillebyCouleur(id, size, color);
    print('article ${articleId}');
    return articleId;
  }
}

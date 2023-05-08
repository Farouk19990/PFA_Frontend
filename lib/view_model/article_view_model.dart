import 'package:mall/repository/produit_repo.dart';
import 'package:mall/view/static/static.dart';

import '../model/article.dart';
import '../repository/article_repo.dart';

class ArticleVM {
  final ArticleRepository articleRepository;
  ArticleVM({
    required this.articleRepository,
  });

  Future<List<Article>> getArticles() async {
    List<Article> articles = [];
    List<Article> list=[];
    for (var i in MyStatic.listOfProductID) {
      print('i $i');
      list = await articleRepository.getArticlesByProductId(i);
      print(list.isEmpty);
      articles.addAll(list);
    }
  print('articles :: $articles');
    print(articles.map((e)=>e.produitA.prix).toList().toSet().toList());
    return articles;
  }
    Future<List<int>> getPrices() async {
    List<Article> articles = await getArticles();
    List<int> prices=articles.map((e)=>e.produitA.prix).toList().toSet().toList();
    prices.sort();
    return prices;
  }
}
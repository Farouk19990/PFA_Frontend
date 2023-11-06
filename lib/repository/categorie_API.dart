import 'package:mall/model/categorie.dart';
import 'package:mall/model/produits.dart';

abstract class CategorieAPI{
  String categorieUrl = "http://10.10.17.102:3000/categories";

  Future<List<Categorie>> getCategories();
}
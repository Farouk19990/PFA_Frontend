import 'package:mall/model/categorie.dart';
import 'package:mall/model/produits.dart';

abstract class CategorieAPI{
  String categorieUrl = "http://192.168.1.15:3000/categories";

  Future<List<Categorie>> getCategories();
}
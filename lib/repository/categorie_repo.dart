import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/categorie.dart';
import 'categorie_API.dart';

class CategorieRepository extends CategorieAPI {
  @override
  Future<List<Categorie>> getCategories() async {
    List<Categorie> listOfCategories = [];
    final response = await http.get(Uri.parse(categorieUrl));
    var dataList = jsonDecode(response.body) as List;
    listOfCategories =
        dataList.map((categorie) => Categorie.fromjson(categorie)).toList();
    print("categorieRepository");
    return listOfCategories;
  }
}
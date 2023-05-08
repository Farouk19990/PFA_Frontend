import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mall/model/produits.dart';
import 'package:mall/repository/produit_API.dart';

class ProduitRepository extends ProduitAPI {
  @override
  Future<List<Produit>> getProduits() async {
    List<Produit> listOfProduits = [];
    final response = await http.get(Uri.parse(produitUrl));
    var dataList = jsonDecode(response.body) as List;
    listOfProduits =
        dataList.map((prdouit) => Produit.fromjson(prdouit)).toList();
    return listOfProduits;
  }

}

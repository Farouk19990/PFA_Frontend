import 'package:mall/model/produits.dart';

abstract class ProduitAPI{
  String produitUrl = "http://10.10.17.102:3000/produits";

  Future<List<Produit>> getProduits();
}
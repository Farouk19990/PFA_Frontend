import 'package:mall/model/produits.dart';

abstract class ProduitAPI{
  String produitUrl = "http://192.168.1.15:3000/produits";

  Future<List<Produit>> getProduits();
}
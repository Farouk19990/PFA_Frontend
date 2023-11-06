
import 'package:mall/model/boutique.dart';

abstract class BoutiqueAPI{
  String boutiqueUrl = "http://10.10.17.102:3000/boutiques";

  Future<List<Boutique>> getBoutiques();
}
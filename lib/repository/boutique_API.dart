
import 'package:mall/model/boutique.dart';

abstract class BoutiqueAPI{
  String boutiqueUrl = "http://192.168.1.15:3000/boutiques";

  Future<List<Boutique>> getBoutiques();
}
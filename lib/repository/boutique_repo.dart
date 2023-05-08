import 'dart:convert';

import 'package:http/http.dart' as http;
import '../model/boutique.dart';
import 'boutique_API.dart';

class BoutiqueRepository extends BoutiqueAPI {
  @override
  Future<List<Boutique>> getBoutiques() async {
    List<Boutique> listOfBoutiques = [];
    final response = await http.get(Uri.parse(boutiqueUrl));
    var dataList = jsonDecode(response.body) as List;
    listOfBoutiques =
        dataList.map((boutique) => Boutique.fromjson(boutique)).toList();
    return listOfBoutiques;
  }
}

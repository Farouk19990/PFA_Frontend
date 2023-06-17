import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mall/model/State.dart';
import 'package:mall/repository/State_API.dart';

class StateRepository extends StateAPI {
  @override
  Future<List<StateModel>> getStates() async {
    List<StateModel> listOfState = [];
    final response = await http.get(Uri.parse(stateUrl));
    var dataList = jsonDecode(response.body) as List;
    listOfState = dataList.map((state) => StateModel.fromjson(state)).toList();
    return listOfState;
  }
}

import '../model/State.dart';

abstract class StateAPI{
  String stateUrl = "http://10.10.17.102:3000/villes";

  Future<List<StateModel>> getStates();
}
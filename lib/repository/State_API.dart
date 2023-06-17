import '../model/State.dart';

abstract class StateAPI{
  String stateUrl = "http://192.168.1.15:3000/villes";

  Future<List<StateModel>> getStates();
}
import '../model/command.dart';

abstract class CommandAPI{
  String commandUrl = "http://10.10.17.102:3000/commandes";

  Future<List<Command>> getAllCommand();
  Future<String> passerCommand(int prixT,int qteT,int clientID);

}
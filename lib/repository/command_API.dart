import '../model/command.dart';

abstract class CommandAPI{
  String commandUrl = "http://192.168.1.15:3000/commandes";

  Future<List<Command>> getAllCommand();
  Future<String> passerCommand(int prixT,int qteT,int clientID);

}
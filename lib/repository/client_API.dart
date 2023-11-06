import '../model/client.dart';
import '../model/command.dart';

abstract class ClientAPI{
  String clientUrl = "http://10.10.17.102:3000/clients";

  Future<List<Client>> getAll();
  Future<List<Client>> getClientByEmail(String email);
  Future<List<Command>> getClientCommand(int id);
}
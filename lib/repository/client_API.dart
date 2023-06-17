import '../model/client.dart';
import '../model/command.dart';

abstract class ClientAPI{
  String clientUrl = "http://192.168.1.15:3000/clients";

  Future<List<Client>> getAll();
  Future<List<Client>> getClientByEmail(String email);
  Future<List<Command>> getClientCommand(int id);
}
import 'package:mall/view/static/static.dart';

import '../model/client.dart';
import '../model/command.dart';
import '../repository/client_repo.dart';

class ClientVM {
  final ClientRepository clientRepo;
  ClientVM({
    required this.clientRepo,
  });
  Future<List<Client>> get() async {
    return await clientRepo.getAll();
  }

  Future<List<Client>> getByEmail() async {
    print("getByEmail " + MyStatic.userEmail);
    List<Client> clients = await clientRepo.getAll();
    print(clients);
    return clients
        .where((element) => element.email == MyStatic.userEmail)
        .toList();
  }

  Future<List<Command>> getCommand(int id) async {
    return await clientRepo.getClientCommand(id);
  }
}

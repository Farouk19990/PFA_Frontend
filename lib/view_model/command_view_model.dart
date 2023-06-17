import '../repository/command_repo.dart';

class CommandVM {
  final CommandRepository commandRepo;
  CommandVM({
    required this.commandRepo,
  });
  Future<String> order(int prixT, int qteT, int clientID) async {
    return await commandRepo.passerCommand(prixT, qteT, clientID);
  }
}

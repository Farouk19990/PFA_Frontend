import 'package:mall/repository/ligne_command_repo.dart';

import '../model/ligneCommand.dart';

class LigneCommandVM {
  final LigneCommandRepo lignecommandRepo;
  LigneCommandVM({
    required this.lignecommandRepo,
  });
  void order(String commandID) {
    lignecommandRepo.ligneCommand(commandID);
  }
   Future<List<LigneCommand>> getCommand(int commandID) async {
    return await lignecommandRepo.getArticleByLigneCommandID(commandID);
  }
}

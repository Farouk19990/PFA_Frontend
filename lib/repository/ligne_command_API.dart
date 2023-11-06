import '../model/article.dart';
import '../model/ligneCommand.dart';

abstract class LigneCommandAPI {
  String lignCommandUrl = "http://10.10.17.102:3000/lignescommandes";
  ligneCommand(String commandID);
  Future<List<LigneCommand>> getArticleByLigneCommandID(int commandID);
}

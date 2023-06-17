import '../model/article.dart';
import '../model/ligneCommand.dart';

abstract class LigneCommandAPI {
  String lignCommandUrl = "http://192.168.1.15:3000/lignescommandes";
  ligneCommand(String commandID);
  Future<List<LigneCommand>> getArticleByLigneCommandID(int commandID);
}

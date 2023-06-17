import '../model/State.dart';
import '../repository/State_Repo.dart';

class StateVM {
  final StateRepository stateRepo;
  StateVM({
    required this.stateRepo,
  });
  Future<List<StateModel>> get() async {
    return await stateRepo.getStates();
  }
}

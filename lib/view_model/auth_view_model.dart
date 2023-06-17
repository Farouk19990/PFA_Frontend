import '../repository/auth_repo.dart';

class AuthVM {
  final AuthRepository authRepository;
  AuthVM({
    required this.authRepository,
  });
  Future<String> get() async {
    String auth = await authRepository.connect('zaraAdmin','123456');
   return auth; 
  }
  Future<String> loginIn(String login,String password)async {
    String auth = await authRepository.connect(login,password);
   return auth; 
  }
  void register(String login,String  email,String  password){
    authRepository.register(login, email, password);
  }
}

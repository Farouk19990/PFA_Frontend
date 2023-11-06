abstract class AuthAPI{
  String authUrl = "http://10.10.17.102:3000/auth";

  Future<String> connect(String login,String password);
  register(String login,String email,String password);
}
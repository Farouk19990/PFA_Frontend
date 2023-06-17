abstract class AuthAPI{
  String authUrl = "http://192.168.1.15:3000/auth";

  Future<String> connect(String login,String password);
  register(String login,String email,String password);
}
import 'dart:convert';
import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:mall/model/token.dart';
import 'package:mall/repository/auth_API.dart';
import 'package:http/http.dart' as http;
import 'package:mall/view/static/static.dart';

class AuthRepository extends AuthAPI {
  @override
  Future<String> connect(String login, String password) async {
    String yesOrNo = "no";
    var json =
        jsonEncode(<String, dynamic>{'login': login, 'password': password});
    final response = await http.post(Uri.parse('$authUrl/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json);

    var datalist = jsonDecode(response.body);
    if (datalist['secretData'] != null) {
      String email = datalist['user']['email'];
      MyStatic.userEmail = email;
      
      var secretData = Token.fromjson(datalist['secretData']);
      MyStatic.staticT = secretData.token;

      yesOrNo = "yes";
      final cookieJar = CookieJar();
      final cookie = Cookie('jwt', MyStatic.staticT);
      cookieJar.saveFromResponse(Uri.parse(authUrl), [cookie]);

      //print('yoo  ${datalist}');
    }
    return yesOrNo;
  }

  @override
  Future<void> register(String login, String email, String password) async {
    var json = jsonEncode(<String, dynamic>{
      'email': email,
      'login': login,
      'password': password,
      'role': 1
    });
    await http.post(
      Uri.parse('$authUrl/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json,
    );
  }
}

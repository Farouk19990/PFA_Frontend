// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:mall/view/register_page.dart';
import 'package:mall/view/shipping_page.dart';
import 'package:mall/view/static/boutiqueStatic.dart';
import 'package:mall/view/static/static.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repository/auth_repo.dart';
import '../view_model/auth_view_model.dart';
import 'bottom_navigation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var authRepository = AuthVM(authRepository: AuthRepository());
  void storeAccountData(String login, String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("Login&Pass", [login, password]);
  }

  bool exist = false;
  Future checkPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> logPass = prefs.getStringList('Login&Pass') ?? [];
    if (logPass.isNotEmpty) {
      exist = true;
    }
  }

  Future<String> checkConnected(String login, String password) async {
    String check = await authRepository.loginIn(login, password);
    return check;
  }

  TextEditingController txt_login = new TextEditingController();
  TextEditingController txt_password = new TextEditingController();
  String error = "";
  Future<bool> validate(String login, String password) async {
    String check = await checkConnected(login, password);
    print("check: " + check);
    if (check == "yes") {
      if (login.isNotEmpty && password.length > 7 && password.isNotEmpty) {
        storeAccountData(login, password);
        return true;
      }
    }
    if (check == "no") {
      error = "Check your information.";
      return false;
    }
    error = "Please enter a correct information.";
    return false;
  }

  @override
  void initState() {
    super.initState();
    checkPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Center(
                  child: Image.asset(
                'asset/MallOfTunisia.png',
                width: 250,
              )),
            ),
            SizedBox(
              height: 5,
            ),
            Text('Login to your Account',
                style: GoogleFonts.caladea(
                  fontSize: 30,
                )),
            Container(
              height: 40,
              child: error.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              error,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.istokWeb(
                                fontSize: 21,
                                color: Color(0xffffffff),
                              ),
                            ),
                          )),
                    )
                  : SizedBox(
                      height: 40,
                    ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              //height: 55,
              child: TextField(
                controller: txt_login,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(11),
                    child: Image.asset(
                        'asset/bottomNavigationBar_Icons/user.png',
                        width: 30,
                        height: 30),
                  ),
                  label: Text(
                    'Login',
                    style: GoogleFonts.istokWeb(fontSize: 22),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              //height: 55,
              child: TextField(
                controller: txt_password,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(11),
                    child: Image.asset(
                      'asset/password.png',
                      width: 30,
                      height: 30,
                    ),
                  ),
                  label: Text(
                    'Password',
                    style: GoogleFonts.istokWeb(fontSize: 22),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Forget your password?',
                    style: GoogleFonts.caladea(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(
                  width: 10,
                ),
                Image.asset(
                  'asset/right-arrow-login.png',
                  height: 30,
                  width: 30,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterPage()));
              },
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Create an account',
                        style: GoogleFonts.caladea(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      'asset/right-arrow-login.png',
                      height: 30,
                      width: 30,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            TextButton(
              onPressed: () async {
                bool result = await validate(txt_login.text, txt_password.text);
                if (result == true) {
                  print('checkk where to go ${MyStatic.goingToTheShipping}');
                  if (MyStatic.goingToTheShipping.isNotEmpty) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShippingPage()));
                  }else{
                       Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BottomNavigationB(
                              id: BoutiqueStatic.id,
                              imglogo: BoutiqueStatic.imglogo,
                              pageIndex: 4,
                            )));
                  }
                } else {
                  setState(() {});
                }
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(bottom: 15),
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Color(0xffff4d4c),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x3fd32525),
                        offset: Offset(0, 4),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Center(
                      child: Text(
                        'LOGIN',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.istokWeb(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

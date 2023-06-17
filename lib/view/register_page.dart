// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mall/view/shipping_page.dart';
import 'package:mall/view/static/boutiqueStatic.dart';

import '../repository/auth_repo.dart';
import '../view_model/auth_view_model.dart';
import 'Login_page.dart';
import 'bottom_navigation.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var authRepository = AuthVM(authRepository: AuthRepository());
  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  String print = "";
  bool validate(String name, String email, String password) {
    if (email.contains('@') &&
        name.isNotEmpty &&
        password.length > 7 &&
        password.isNotEmpty &&
        email.isNotEmpty) {
      authRepository.register(name, email, password);
      return true;
    }
    print = "Please enter a correct information.";
    return false;
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
              Text('Create an Account',
                  style: GoogleFonts.caladea(
                    fontSize: 30,
                  )),
              Container(
                height: 40,
                child: print.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                print,
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
              TextField(
                controller: txtName,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Image.asset(
                        'asset/bottomNavigationBar_Icons/user.png',
                        width: 30,
                        height: 30),
                  ),
                  label: Text(
                    'Name',
                    style: GoogleFonts.istokWeb(fontSize: 22),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: txtEmail,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(11),
                    child:
                        Image.asset('asset/email.png', width: 30, height: 30),
                  ),
                  label: Text(
                    'Email',
                    style: GoogleFonts.istokWeb(fontSize: 22),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                //height: 60,
                child: TextField(
                  controller: txtPassword,
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
                height: 170,
              ),
              TextButton(
                // buttonprimaryinactivesmalltcr (9:1332)
                onPressed: () {
                  if (validate(txtName.text, txtEmail.text, txtPassword.text) ==
                      true) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomNavigationB(
                                  id: BoutiqueStatic.id,
                                  imglogo: BoutiqueStatic.imglogo,
                                  pageIndex: 4,
                                )));
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
                      boxShadow: [
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
                          'Sign in',
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
        ),
      ),
    );
  }
}

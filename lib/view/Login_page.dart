// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  
                            SizedBox(width: 10,),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Center(
                    child: Image.asset(
                  'asset/MallOfTunisia.png',
                  width: 250,
                )),
              ),
              SizedBox(
                height: 20,
              ),Text('Login to your Account',
                        style: GoogleFonts.caladea(
                            fontSize: 30, )),
                            SizedBox(
                height: 20,
              ),
              TextField(
                // controller: txt_gallerie,
                decoration: InputDecoration(
                  prefixIcon:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('asset/email.png',width: 30,height: 30),
                  ),
                  label: Text(
                    'Email',
                    style: GoogleFonts.istokWeb(fontSize: 25),
                  ),
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                // controller: txt_gallerie,
                decoration: InputDecoration(
                  prefixIcon:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('asset/password.png',width: 30,height: 30,),
                  ),
      
                  label: Text(
                    'Password',
                    style: GoogleFonts.istokWeb(fontSize: 25),
                  ),
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
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
                            SizedBox(width: 10,),
                    Image.asset(
                      'asset/right-arrow-login.png',
                      height: 30,
                      width: 30,
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Create an account',
                        style: GoogleFonts.caladea(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                            SizedBox(width: 10,),
                    Image.asset(
                      'asset/right-arrow-login.png',
                      height: 30,
                      width: 30,
                    )
                  ],
                ),
                SizedBox(height: 160,),
                TextButton(
                    // buttonprimaryinactivesmalltcr (9:1332)
                    onPressed: () {   Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginPage()));},
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
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mall/view/Login_page.dart';
import 'package:mall/view/static/boutiqueStatic.dart';
import 'package:mall/view/static/static.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/client.dart';
import '../model/command.dart';
import '../repository/auth_repo.dart';
import '../repository/client_repo.dart';
import '../view_model/auth_view_model.dart';
import '../view_model/client_view_model.dart';
import 'bottom_navigation.dart';
import 'order_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var clientRepository = ClientVM(clientRepo: ClientRepository());
  var authRepository = AuthVM(authRepository: AuthRepository());
  List<Client> client = [];
  String verif = "wait";
  String login = "";
  int clientID = 0;
  Future checkConnected() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> logPass = prefs.getStringList('Login&Pass') ?? [];
    //print("check connected ${logPass.length}");
    if (logPass.isNotEmpty) {
      login = logPass[0];
      await authRepository.loginIn(logPass[0], logPass[1]);
      verif = "connected";
      client = await clientRepository.getByEmail();
      listCommand = await clientRepository.getCommand(client.first.id);
      setState(() {
        clientID = client.first.id;
      });
      return;
    }
    setState(() {
      verif = "not connected";
    });
  }

  List<Command> listCommand = [];
  Future<List<Command>> getCommand(int id) async {
    print("cliend IDD (1)::  $clientID");
    listCommand = await clientRepository.getCommand(clientID);
    print('lissst command: ${listCommand.length}');
    setState(() {});
    return listCommand;
  }

  Future<void> logOut() async {
    print("logout");
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("Login&Pass");
    MyStatic.userEmail = "";
    MyStatic.userID = 0;
    MyStatic.goingToTheShipping="";

    checkConnected();
    setState(() {
      
    });
  }

  @override
  void initState() {
    super.initState();
    checkConnected();
    print('connnec    dddd $verif');
  }

  @override
  Widget build(BuildContext context) {
    if (verif == "connected") {
      return Container(
          margin: EdgeInsets.only(top: 80),
          child: MyStatic.orderDisplay.isEmpty
              ? Container(
                  margin: EdgeInsets.only(top: 20, left: 20),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text("My Profile",
                            style: GoogleFonts.istokWeb(
                              fontSize: 34,
                              fontWeight: FontWeight.w700,
                            )),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            alignment: Alignment.topLeft,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                "https://www.ccair.org/wp-content/plugins/phastpress/phast.php/c2Vydm/ljZT1pbWFnZXMmc3JjPWh0dHBzJTNBJTJGJTJGd3d3LmNjYWlyLm9yZyUyRndwLWNvbnRlbnQlMkZ1cGxvYWRzJTJGMjAxNSUyRjA0JTJGd2FsbHBhcGVyLWZvci1mYWNlYm9vay1wcm9maWxlLXBob3RvLWUxNDQwNjI0NTA1NTc0LmpwZyZjYWNoZU1hcmtlcj0xNTE3MTc3MDkwLTE2OTc4JnRva2VuPTY4NDIyY2YwN2Q4ODAxZmM.q.jpg",
                                width: 100,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(login,
                                  style: GoogleFonts.istokWeb(
                                      fontSize: 22, color: Colors.black)),
                              Text(client.first.email,
                                  style: GoogleFonts.istokWeb(
                                      fontSize: 22, color: Colors.grey)),
                            ],
                          ),
                        ],
                      ),
                      /*   Card(
                    child: ListTile(
                      title: Text('Order',
                          style: GoogleFonts.istokWeb(
                              fontSize: 22, color: Colors.black)),
                              leading: ,
                    ),
                  ) */

                      GestureDetector(
                        onTap: () {
                          setState(() {
                            MyStatic.orderDisplay = "displayOrder";
                          }); /* 
                      
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrderPage(id: clientID))); */
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 10, right: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('My Order',
                                      style: GoogleFonts.istokWeb(
                                          fontSize: 22,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400)),
                                  Text(
                                      'Already have ${listCommand.length} orders',
                                      style: GoogleFonts.istokWeb(
                                          fontSize: 18,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w400)),
                                ],
                              ),
                              Image.asset(
                                "asset/right-arrow.png",
                                width: 38,
                                height: 38,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, right: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text('Settings',
                                    style: GoogleFonts.istokWeb(
                                        fontSize: 22,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                            Image.asset(
                              "asset/right-arrow.png",
                              width: 38,
                              height: 38,
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 40, right: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text('Logout',
                                    style: GoogleFonts.istokWeb(
                                        fontSize: 22,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                logOut();
                                MaterialPageRoute(
                                    builder: (context) => BottomNavigationB(
                                          id: BoutiqueStatic.id,
                                          imglogo: BoutiqueStatic.imglogo,
                                          pageIndex: 0,
                                        ));
                                setState(() {});
                              },
                              child: Image.asset(
                                "asset/logout.png",
                                width: 38,
                                height: 38,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : OrderPage(id: clientID));
    } else if (verif == "wait") {
      return Center(child: RefreshProgressIndicator());
    } else {
      return LoginPage();
    }
  }
}

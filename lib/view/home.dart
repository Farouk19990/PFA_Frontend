// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mall/model/boutique.dart';
import 'package:mall/view/static/boutiqueStatic.dart';

import '../repository/boutique_repo.dart';
import '../view_model/boutique_view_model.dart';
import 'bottom_navigation.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var boutiqueRepository = BoutiqueVM(boutiqueRepository: BoutiqueRepository());
  List<Boutique> listOfBoutiques = [];
  void get() async {
    listOfBoutiques = await boutiqueRepository.fetchData();
    print("list ::  ${listOfBoutiques.last.name}");
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top:80),
            child: Center(child: Image.asset('asset/MallOfTunisia.png',width: 250,)),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(30, 10, 4, 9),
              child: Wrap(
                children: List.generate(
                    listOfBoutiques.length,
                    (index) => Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 18, 18),
                          child: Column(children: [
                            GestureDetector(
                              onTap: () {
                                BoutiqueStatic.background=listOfBoutiques[index].image;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        BottomNavigationB(
                                      pageIndex: 0,
                                      id: listOfBoutiques[index].id,
                                      imglogo: listOfBoutiques[index].logo,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      blurRadius: 80,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Image.network(listOfBoutiques[index].logo),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              listOfBoutiques[index].name,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                height: 1.2125,
                                color: Color(0x99ff4750),
                              ),
                            ),
                          ]),
                        )),
              )),
        ],
      ),
    );
  }
}

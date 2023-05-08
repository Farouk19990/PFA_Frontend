// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mall/view/shop_page.dart';
import 'package:mall/view/static/static.dart';

import '../model/categorie.dart';
import '../model/produits.dart';
import '../repository/categorie_repo.dart';
import '../repository/produit_repo.dart';
import '../view_model/categorie_view_model.dart';
import '../view_model/produit_view_model.dart';
import 'bottom_navigation.dart';

class CategoriePage extends StatefulWidget {
  final int? id;
  final String? imglogo;
  const CategoriePage({super.key, this.id, this.imglogo});

  @override
  State<CategoriePage> createState() => _CategoriePageState();
}

class _CategoriePageState extends State<CategoriePage> {
  var categorieRepository =
      CategorieVM(categorieRepository: CategorieRepository());
  String not_pressed = "check-mark";
  String pressed = "check";
  List<String> selectedIndex = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: categorieRepository.fetchData(),
        builder: (context, snapshot) {
          print(snapshot.data);
          if (snapshot.hasData) {
            List<Categorie>? listOfData = snapshot.data;

            return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  title: Container(
                    margin: EdgeInsets.only(left: 50),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadiusDirectional.circular(10)),
                          child: Image.network(
                            widget.imglogo.toString(),
                            width: 40,
                            height: 32,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                            child: Text('Categories',
                                style:
                                    GoogleFonts.istokWeb(color: Colors.black))),
                      ],
                    ),
                  ),
                  centerTitle: true,
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
                body: Column(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: ListView.builder(
                            itemCount: listOfData!.length,
                            itemBuilder: ((context, index) => Card(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.white70, width: 1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  elevation: 10,
                                  child: ListTile(
                                    onTap: () {
                                      MyStatic.selectedCategorie =
                                          listOfData[index].name.toString();
                                      //MyStatic.selectedNAMEsousCategorie.clear();
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BottomNavigationB(
                                                    pageIndex: 1,
                                                    id: widget.id,
                                                    imglogo: widget.imglogo,
                                                  )));
                                    },
                                    contentPadding: EdgeInsets.all(20),
                                    trailing: Image.asset(
                                      'asset/right-arrow.png',
                                      height: 42,
                                      width: 42,
                                    ),
                                    leading: Image.asset('asset/shopping.png',
                                        height: 40, width: 40),
                                    title:
                                        Text(listOfData[index].name.toString(),
                                            style: GoogleFonts.caladea(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              height: 1.15,
                                            )),
                                  ),
                                ))),
                      ),
                    ),
                  ],
                ));
          } else {
            return Scaffold();
          }
        });
  }
}

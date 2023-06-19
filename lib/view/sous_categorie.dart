// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mall/view/shop_page.dart';
import 'package:mall/view/static/static.dart';

import '../model/produits.dart';
import '../repository/produit_repo.dart';
import '../view_model/produit_view_model.dart';
import 'bottom_navigation.dart';

class SousCategoriePage extends StatefulWidget {
  final int? id;
  final String? imglogo;
  const SousCategoriePage({super.key, this.id,this.imglogo});

  @override
  State<SousCategoriePage> createState() => _SousCategoriePageState();
}

class _SousCategoriePageState extends State<SousCategoriePage> {
  var produitRepository = ProduitVM(produitRepository: ProduitRepository());
  String not_pressed = "check-mark";
  String pressed = "check";
  List<String> selectedIndex = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: produitRepository.sousCategorieByCategorie(widget.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<String>? listOfData = snapshot.data;

            return Scaffold(
                bottomNavigationBar: Container(
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {
                              MyStatic.selectedNAMEsousCategorie.clear();
                              MyStatic.catOrsubCat="";
                              Navigator.pop(context);
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            child: Container(
                              width: 160,
                              height: 45,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Center(
                                child: Center(
                                  child: Text(
                                    'Discard',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.istokWeb(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      height: 1.4285714286,
                                      color: Color(0xff222222),
                                    ),
                                  ),
                                ),
                              ),
                            )),
                        TextButton(
                          // buttonprimaryinactivesmalltcr (9:1332)
                          onPressed: () {
                            MyStatic.selectedNAMEsousCategorie = selectedIndex;
                            MyStatic.catOrsubCat="category";
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    BottomNavigationB(
                                  pageIndex: 1,
                                  id: widget.id,
                                  imglogo: widget.imglogo,
                                ),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Container(
                            width: 160,
                            height: 45,
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
                                  'Apply',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.istokWeb(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    height: 1.4285714286,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  title: Container(
                      child: Text('Categories',
                          style: GoogleFonts.istokWeb(color: Colors.black))),
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
                                      setState(() {
                                        if (selectedIndex.contains(listOfData[index])) {
                                          selectedIndex.remove(listOfData[index]);
                                        } else {
                                          selectedIndex.add(listOfData[index]);
                                        }
                                        print("item pressed $selectedIndex");
                                      });
                                    },
                                    contentPadding: EdgeInsets.all(20),
                                    trailing: selectedIndex.contains(listOfData[index])/* || MyStatic.selectedNAMEsousCategorie.contains(listOfData[index]) */
                                        ? Image.asset(
                                            'asset/${pressed}.png',
                                            height: 42,
                                            width: 42,
                                          )
                                        : Image.asset(
                                            'asset/${not_pressed}.png',
                                            height: 40,
                                            width: 40,
                                          ),
                                    leading: Image.asset('asset/hanger.png',
                                        height: 40, width: 40),
                                    title: Text(listOfData[index].toString(),
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

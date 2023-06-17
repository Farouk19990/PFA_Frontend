// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mall/model/produits.dart';
import 'package:mall/view/static/static.dart';
import '../repository/produit_repo.dart';
import '../view_model/produit_view_model.dart';
import 'categorie.dart';
import 'static/boutiqueStatic.dart';

class MainPage extends StatefulWidget {
  final int? id;
  final String? imglogo;
  const MainPage({super.key, this.id, this.imglogo});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var produitRepository = ProduitVM(produitRepository: ProduitRepository());
  String not_pressed = "heart_not_pressed";
  String pressed = "heart_when_pressed_1";
  List<int> selectedIndex = [];
  @override
  void initState() {
    super.initState();
    BoutiqueStatic.id = widget.id!;
    BoutiqueStatic.imglogo = widget.imglogo!;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: produitRepository.data(widget.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Produit>? sns = snapshot.data;
            return Scaffold(
              //backgroundColor: Colors.grey,
              body: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    //automaticallyImplyLeading: false,
                    pinned: true,
                    bottom: PreferredSize(
                        child: Container(
                          //color: Colors.red,
                          width: double.maxFinite,
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      shape: StadiumBorder()),
                                  onPressed: () {
                                    MyStatic.catOrsubCat = "";
                                    MyStatic.selectedNAMEsousCategorie.clear();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => CategoriePage(
                                                  id: widget.id,
                                                  imglogo: widget.imglogo,
                                                )));
                                  },
                                  child: Text(
                                    'Categories',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    padding: EdgeInsets.all(1),
                                    child: Image.network(
                                      widget.imglogo.toString(),
                                      width: 65,
                                      height: 45,
                                    ))
                              ]),
                        ),
                        preferredSize: Size.fromHeight(0)),
                    expandedHeight: 400,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Image.network(
                        'https://assets.vogue.com/photos/6158ba2b2067f42dee55ef8c/master/w_2560%2Cc_limit/ZARA_CG_020921_06_915_03.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 300,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                      shrinkWrap: true,
                      primary: false,
                      itemBuilder: (context, index) {
                        return Container(
                          //padding: EdgeInsets.all(10),
                          margin: EdgeInsetsDirectional.only(start: 10),
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade300,
                                spreadRadius: 0,
                                blurRadius: 10),
                          ], borderRadius: BorderRadius.circular(5)),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  sns[index].image,
                                  fit: BoxFit.cover,
                                  height: 250,
                                ),
                              ),
                              Positioned(
                                // addtofavoritebuttoninactiveEtA (I5:534;36:6)
                                left: 120,
                                top: 220,
                                child: Align(
                                  child: SizedBox(
                                    width: 38,
                                    height: 38,
                                    child: Container(
                                      padding: EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black38,
                                              spreadRadius: 0,
                                              blurRadius: 10),
                                        ],
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (selectedIndex.contains(index)) {
                                              selectedIndex.remove(index);
                                            } else {
                                              selectedIndex.add(index);
                                            }
                                            print(
                                                "item pressed $selectedIndex");
                                          });
                                        },
                                        child: selectedIndex.contains(index)
                                            ? Image.asset(
                                                'asset/cards/${pressed}.png',
                                                height: 36,
                                                width: 36,
                                              )
                                            : Image.asset(
                                                'asset/cards/${not_pressed}.png',
                                                height: 36,
                                                width: 36,
                                              ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 250,
                                child: Container(
                                    margin: EdgeInsets.all(5),
                                    child: Text(
                                      sns[index].sousCategorie.name,
                                      style: GoogleFonts.caladea(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        height: 1.15,
                                        color: Color.fromARGB(255, 114, 88, 88),
                                      ),
                                    )),
                              ),
                              Positioned(
                                top: 265,
                                child: Container(
                                    width: 100,
                                    height: 200,
                                    margin: EdgeInsets.all(5),
                                    child: Text(
                                      sns[index].name,
                                      style: GoogleFonts.caladea(
                                        fontWeight: FontWeight.w700,
                                        height: 1.15,
                                        color: Color(0xff222222),
                                        //color: Color(0xff9b9b9b),
                                      ),
                                    )),
                              ),
                              Positioned(
                                top: 265,
                                left: 100,
                                child: Container(
                                    width: 100,
                                    height: 200,
                                    margin: EdgeInsets.all(5),
                                    child: Text(
                                      sns[index].prix.toString() + " DT",
                                      style: GoogleFonts.caladea(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        height: 1.15,
                                        color: Color(0xffff4d4c),
                                        //color: Color(0xff9b9b9b),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: sns!.length,
                    ),
                  ),
                  /*   SliverList(
                      delegate: SliverChildBuilderDelegate(
                    childCount: sns.length,
                    (context, index) {
                      return Container(
                          child: Column(
                        children: [
                          Container(
                            margin: EdgeInsetsDirectional.all(5),
                            child: Image.network(
                              sns[index].image,
                              width: 100,
                              height: 100,
                            ),
                          )
                        ],
                      ));
                    },
                  )), */
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}

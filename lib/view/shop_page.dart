// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mall/model/inBag.dart';
import 'package:mall/view/filter_page.dart';
import 'package:mall/view/product_page.dart';

import 'package:mall/view/static/static.dart';

import '../model/produits.dart';
import '../repository/produit_repo.dart';
import '../view_model/produit_view_model.dart';

class ShopPage extends StatefulWidget {
  final int? id;
  final String? imglogo;
  const ShopPage({super.key, this.id, this.imglogo});
  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  var produitRepository = ProduitVM(produitRepository: ProduitRepository());
  List<String> list = [];
  String not_pressed = "heart_not_pressed";
  String pressed = "heart_when_pressed_1";
  List<int> selectedIndex = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: produitRepository.giveMeMethode(widget.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Produit>? sns = snapshot.data;

            /*  if (sns!.length == 0) {
              Future.delayed(Duration.zero, () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CategoriePage(
                              id: widget.id,
                              imglogo: widget.imglogo,
                            )));
              });
            } */
            return Scaffold(
              //extendBodyBehindAppBar: true,
              appBar: AppBar(
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
                            child: Text(MyStatic.selectedCategorie,
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
                  /*  if(sns!.isEmpty){
                    return Container(
                            child: Center(
                              child:
                                  Lottie.asset('asset/lottie/no-data.json'),
                            ),
                          )
                  } */
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(100),
                    child: FutureBuilder(
                      future:
                          produitRepository.sousCategorieByCategorie(widget.id),
                      builder: (context, snapshot) {
                        if (snapshot.data == null) {
                          return Container(
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }
                        List<String>? listOfSousCategorie = snapshot.data;
                        if (MyStatic.catOrsubCat == "category") {
                          listOfSousCategorie =
                              MyStatic.selectedNAMEsousCategorie;
                        }

                        return SizedBox(
                          height: 100,
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 50,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: listOfSousCategorie?.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: EdgeInsets.only(
                                            left: 20, top: 5, bottom: 5),
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.shade400,
                                                spreadRadius: 0,
                                                blurRadius: 70,
                                                offset: Offset(0, 3),
                                              ),
                                            ],
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadiusDirectional
                                                    .circular(10)),
                                        child: Center(
                                          child: Text(
                                            listOfSousCategorie![index]
                                                .toString(),
                                            style: GoogleFonts.istokWeb(
                                                color: Colors.white,
                                                fontSize: 16),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.shade400,
                                          spreadRadius: 0,
                                          blurRadius: 50,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                      color: Colors.grey.shade200,
                                      borderRadius:
                                          BorderRadiusDirectional.circular(10)),
                                  margin: EdgeInsets.only(
                                      right: 20, left: 20, top: 5, bottom: 5),
                                  alignment: Alignment.topLeft,
                                  height: 50,

                                  padding: EdgeInsets.all(2),
                                  //color: Colors.red,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          MyStatic.listOfProductID.clear();
                                          MyStatic.listOfProductID = sns!
                                              .map(
                                                (e) => e.id,
                                              )
                                              .toList();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      FilterPage(
                                                        id: widget.id,
                                                        imglogo: widget.imglogo,
                                                      )));
                                        },
                                        child: Container(
                                            child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(6),
                                              child: Image.asset(
                                                  'asset/filter.png'),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                              'Filter',
                                              style: GoogleFonts.istokWeb(
                                                  fontSize: 22),
                                            ),
                                          ],
                                        )),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          showModalBottomSheet(
                                              context: context,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                          top: Radius.circular(
                                                              20))),
                                              builder: (context) => Container(
                                                    margin: EdgeInsets.only(
                                                        left: 20, right: 40),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Sort by',
                                                          style: GoogleFonts
                                                              .caladea(
                                                                  fontSize: 25,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              child: Text(
                                                                'Price: Highest to low',
                                                                style:
                                                                    GoogleFonts
                                                                        .caladea(
                                                                  fontSize: 25,
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              child:
                                                                  Image.asset(
                                                                'asset/checkbox.png',
                                                                width: 30,
                                                                height: 30,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              child: Text(
                                                                'Price: lowest to high',
                                                                style:
                                                                    GoogleFonts
                                                                        .caladea(
                                                                  fontSize: 25,
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              child:
                                                                  Image.asset(
                                                                'asset/!checkbox.png',
                                                                width: 30,
                                                                height: 30,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 40,
                                                        ),
                                                      ],
                                                    ),
                                                  ));
                                        },
                                        child: Container(
                                            child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(3),
                                              child:
                                                  Image.asset('asset/sort.png'),
                                            ),
                                            SizedBox(
                                              width: 50,
                                            ),
                                            Text(
                                              'Price',
                                              style: GoogleFonts.istokWeb(
                                                  fontSize: 25),
                                            ),
                                          ],
                                        )),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )),
              body: sns!.isEmpty
                  ? Container(
                      child: Center(
                        child: Lottie.asset('asset/lottie/no-data.json'),
                      ),
                    )
                  : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 335,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                      shrinkWrap: true,
                      primary: false,
                      itemBuilder: (context, index) {
                        print(
                            'articles produits ${sns[index].articles.length}');

                        return Opacity(
                          opacity: sns[index].articles.length == 2 ? 0.7 : 1,
                          child: Container(
                            margin:
                                EdgeInsetsDirectional.only(top: 10, start: 10),
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade300,
                                  spreadRadius: 0,
                                  blurRadius: 10),
                            ], borderRadius: BorderRadius.circular(10)),
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
                                sns[index].articles.length == 2
                                    ? Positioned(
                                        child: Image.asset(
                                            'asset/out-of-stock.png'))
                                    : SizedBox(),
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
                                              if (sns[index].articles.length >
                                                  2) {
                                                if (selectedIndex
                                                    .contains(index)) {
                                                  selectedIndex.remove(index);
                                                } else {
                                                  
                                                  selectedIndex.add(index);
                                                }
                                                print(
                                                    "item pressed $selectedIndex");
                                              }
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
                                sns[index].articles.length > 2
                                    ? Positioned(
                                        top: 220,
                                        child: Container(
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            margin: EdgeInsets.all(5),
                                            child: GestureDetector(
                                              onTap: () {
                                                String imglogoS =
                                                    widget.imglogo.toString();
                                                showModalBottomSheet(
                                                    context: context,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.vertical(
                                                                top: Radius
                                                                    .circular(
                                                                        20))),
                                                    builder: (context) =>
                                                        ProductPage(
                                                            id: sns[index].id,
                                                            imglogo: imglogoS));
                                              },
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.add_shopping_cart,
                                                    color: Colors.white,
                                                  ),
                                                  Text(
                                                    'Add to cart',
                                                    style: GoogleFonts.caladea(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      height: 1.15,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )),
                                      )
                                    : Positioned(
                                        top: 195,
                                        left: 5,
                                        child: Container(
                                          width: 120,
                                          child: Text(
                                            'Sorry,this item is currently sold out.',
                                            style: GoogleFonts.caladea(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                              height: 1.15,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
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
                          ),
                        );
                      },
                      itemCount: sns!.length,
                    ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

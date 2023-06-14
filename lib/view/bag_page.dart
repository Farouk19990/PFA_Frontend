// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mall/model/inBag.dart';
import 'package:mall/view/static/static.dart';

import 'Login_page.dart';

class BagPage extends StatefulWidget {
  const BagPage({super.key});

  @override
  State<BagPage> createState() => _BagPageState();
}

class _BagPageState extends State<BagPage> {
  List<InBag> inBag = [];
  int total = 0;
  void checkTotal() {
    total = 0;
    inBag = MyStatic.inBagList;
    print("check total ${inBag.length}");
    for (var element in inBag) {
      total += (element.price!*element.qte);
    }
  }

  @override
  void initState() {
    super.initState();
    checkTotal();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: inBag.isEmpty
          ? Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 100, left: 20),
                  alignment: Alignment.topLeft,
                  child: Text("My Bag is empty",
                      style: GoogleFonts.istokWeb(
                        fontSize: 34,
                        fontWeight: FontWeight.w700,
                      )),
                ),
                Container(
                  child: Center(
                    child: Lottie.asset('asset/lottie/empty-box.json'),
                  ),
                ),
              ],
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 100, left: 20),
                  alignment: Alignment.topLeft,
                  child: Text("My Bag",
                      style: GoogleFonts.istokWeb(
                        fontSize: 34,
                        fontWeight: FontWeight.w700,
                      )),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        //shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: inBag.length,
                        itemBuilder: (context, index) {
                          return Container(
                              margin: EdgeInsets.only(right: 10, left: 10),
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.white70, width: 1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  elevation: 10,
                                  child: Container(
                                      child: Row(
                                    children: [
                                      Image.network(
                                        inBag[index].imgUrl.toString(),
                                        fit: BoxFit.fill,
                                        width: 150,
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 10, left: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                inBag[index]
                                                    .productName
                                                    .toString(),
                                                style: GoogleFonts.istokWeb(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.15,
                                                )),
                                            Container(
                                              margin: EdgeInsets.only(top: 10),
                                              child: Row(children: [
                                                Text('Color:',
                                                    style: GoogleFonts.istokWeb(
                                                      fontSize: 18,
                                                    )),
                                                Text(
                                                    inBag[index]
                                                        .color
                                                        .toString()
                                                        .toUpperCase(),
                                                    style: GoogleFonts.istokWeb(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      height: 1.15,
                                                    )),
                                                Text('  Size:',
                                                    style: GoogleFonts.istokWeb(
                                                      fontSize: 17,
                                                      height: 1.15,
                                                    )),
                                                Text(
                                                    inBag[index]
                                                        .size
                                                        .toString()
                                                        .toUpperCase(),
                                                    style: GoogleFonts.istokWeb(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      height: 1.15,
                                                    )),
                                              ]),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 10),
                                              child: Row(children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      inBag[index].qte++;
                                                      total = total +
                                                          inBag[index].price!;
                                                    });
                                                  },
                                                  child: Card(
                                                    shape: CircleBorder(),
                                                    elevation: 10,
                                                    child: Image.asset(
                                                      'asset/add.png',
                                                      width: 32,
                                                      height: 32,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 10),
                                                  child: Text(
                                                      inBag[index]
                                                          .qte
                                                          .toString(),
                                                      style:
                                                          GoogleFonts.istokWeb(
                                                        fontSize: 27,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        height: 1.15,
                                                      )),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      inBag[index].qte--;
                                                      total = total -
                                                          inBag[index].price!;
                                                      if (inBag[index].qte ==
                                                          0) {
                                                        inBag.remove(
                                                            inBag[index]);
                                                        checkTotal();
                                                      }
                                                    });
                                                  },
                                                  child: Card(
                                                    shape: CircleBorder(),
                                                    elevation: 10,
                                                    child: Image.asset(
                                                      'asset/remove.png',
                                                      width: 32,
                                                      height: 32,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 10),
                                              child: Row(
                                                children: [
                                                  Text('Price:',
                                                      style:
                                                          GoogleFonts.istokWeb(
                                                        fontSize: 22,
                                                      )),
                                                  Text(
                                                      inBag[index]
                                                          .price
                                                          .toString(),
                                                      style:
                                                          GoogleFonts.istokWeb(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          alignment: Alignment.topRight,
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                inBag.remove(inBag[index]);
                                                checkTotal();
                                              });
                                            },
                                            child: Image.asset(
                                              'asset/close-1.png',
                                              width: 15,
                                              height: 15,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ))));
                        }),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total amount:',
                          style: GoogleFonts.istokWeb(
                              fontSize: 22, color: Colors.grey)),
                      Text(total.toString(),
                          style: GoogleFonts.istokWeb(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ),
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
                      margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
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
                            'CHECK OUT',
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
    );
  }
}

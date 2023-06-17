// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mall/view/profile_page.dart';
import 'package:mall/view/static/boutiqueStatic.dart';
import 'package:mall/view/static/static.dart';

import '../model/command.dart';
import '../repository/client_repo.dart';
import '../view_model/client_view_model.dart';
import 'bottom_navigation.dart';
import 'order_item_page.dart';

class OrderPage extends StatefulWidget {
  final int id;
  const OrderPage({super.key, required this.id});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  var clientRepository = ClientVM(clientRepo: ClientRepository());
  int orderId = 0;
  String displayOrderItem = "";
  List<Command> listCommand = [];
  Future<List<Command>> getCommand(int id) async {
    print("cliend IDD ORDER PAGE (1)::  ${id}");
    listCommand = await clientRepository.getCommand(id);
    setState(() {});
    return listCommand;
  }

  @override
  void initState() {
    super.initState();
    MyStatic.orderDisplay = "";
    getCommand(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    if (listCommand.isNotEmpty) {
      return Container(
          margin: EdgeInsets.only(right: 5, left: 10),
          child: displayOrderItem.isEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomNavigationB(
                                      id: BoutiqueStatic.id,
                                      imglogo: BoutiqueStatic.imglogo,
                                      pageIndex: 4,
                                    )));
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      child: Text("My Orders",
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
                              itemCount: listCommand.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  child: Card(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            color: Colors.white70, width: 1),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      elevation: 10,
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Order REF: ${listCommand[index].reference}',
                                                        style: GoogleFonts
                                                            .istokWeb(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      Text(
                                                        listCommand[index].date,
                                                        style: GoogleFonts
                                                            .istokWeb(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.grey,
                                                        ),
                                                      )
                                                    ]),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Quantity ",
                                                          style: GoogleFonts
                                                              .istokWeb(
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                        Text(
                                                          "${listCommand[index].qteTotal}",
                                                          style: GoogleFonts
                                                              .istokWeb(
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Total Amount ",
                                                          style: GoogleFonts
                                                              .istokWeb(
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                        Text(
                                                          listCommand[index]
                                                              .prixTotal
                                                              .toString(),
                                                          style: GoogleFonts
                                                              .istokWeb(
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: 10, left: 100),
                                                width: 150,
                                                height: 50,
                                                child: TextButton(
                                                  // buttonprimaryinactivesmalltcr (9:1332)
                                                  onPressed: () {
                                                    setState(() {
                                                      orderId =
                                                          listCommand[index].id;
                                                      displayOrderItem =
                                                          "displayOrderItem";
                                                    });
                                                  },
                                                  style: TextButton.styleFrom(
                                                    padding: EdgeInsets.zero,
                                                  ),
                                                  child: Container(
                                                    width: double.maxFinite,
                                                    height: double.maxFinite,
                                                    margin: EdgeInsets.only(
                                                        left: 10,
                                                        right: 10,
                                                        bottom: 15),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                      border: Border.all(
                                                          color: Colors.black,
                                                          width: 2),
                                                    ),
                                                    child: Center(
                                                      child: Center(
                                                        child: Text(
                                                          'Details',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: GoogleFonts
                                                              .istokWeb(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ]),
                                      )),
                                );
                              })),
                    )
                  ],
                )
              : OrderItemPage(
                  orderId: orderId,
                ));
    } else {
      return Container(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              child: Lottie.asset('asset/lottie/not-found.json'),
            ),
            Container(
              child: Text("NO ORDER FOUND",
                  style: GoogleFonts.istokWeb(
                    fontSize: 31,
                    fontWeight: FontWeight.w500,
                  )),
            ),
            Container(
              margin: EdgeInsets.only(right: 10, left: 10),
              child: Text("Looks like you haven't make your order yet.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.istokWeb(
                    fontSize: 22,
                  )),
            ),
            Container(
              width: 150,
              height: 50,
              margin: EdgeInsets.only(top:20),
              child: TextButton(
                // buttonprimaryinactivesmalltcr (9:1332)
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BottomNavigationB(
                                id: BoutiqueStatic.id,
                                imglogo: BoutiqueStatic.imglogo,
                                pageIndex: 4,
                              )));
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Center(
                    child: Center(
                      child: Text(
                        'Go Back',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.istokWeb(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}

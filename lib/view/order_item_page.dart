import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mall/view/static/boutiqueStatic.dart';
import 'package:mall/view/static/static.dart';

import '../model/ligneCommand.dart';
import '../repository/ligne_command_repo.dart';
import '../view_model/ligne_command_view_mode.dart';
import 'bottom_navigation.dart';

class OrderItemPage extends StatefulWidget {
  final int orderId;
  const OrderItemPage({super.key, required this.orderId});

  @override
  State<OrderItemPage> createState() => _OrderItemPageState();
}

class _OrderItemPageState extends State<OrderItemPage> {
  var lignecommandRepo = LigneCommandVM(lignecommandRepo: LigneCommandRepo());
  List<LigneCommand> lignecommand = [];
  //List<Colors> lignecommand = [];
  //colors = static.convertStringToColor(colorslist);
  Future get() async {
    lignecommand = await lignecommandRepo.getCommand(widget.orderId);
    print("LLLIIISSSTT : ${lignecommand.length}");
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    get();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: lignecommand.isNotEmpty
            ? Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Order Ref :${lignecommand[0].command.reference}",
                            style: GoogleFonts.istokWeb(
                              fontSize: 18,
                            )),
                        Text("${lignecommand[0].command.date}",
                            style: GoogleFonts.istokWeb(
                                fontSize: 20, color: Colors.grey)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          //shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemCount: lignecommand.length,
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
                                          lignecommand[index]
                                              .article
                                              .produitA
                                              .image
                                              .toString(),
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
                                                  lignecommand[index]
                                                      .article
                                                      .produitA
                                                      .name
                                                      .toString(),
                                                  style: GoogleFonts.istokWeb(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w700,
                                                    height: 1.15,
                                                  )),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 10),
                                                child: Row(children: [
                                                  Text('Color:',
                                                      style:
                                                          GoogleFonts.istokWeb(
                                                        fontSize: 18,
                                                      )),
                                                  Text(
                                                      lignecommand[index]
                                                          .article
                                                          .couleur
                                                          .name
                                                          .toString()
                                                          .toUpperCase(),
                                                      style:
                                                          GoogleFonts.istokWeb(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        height: 1.15,
                                                      )),
                                                  Text('  Size:',
                                                      style:
                                                          GoogleFonts.istokWeb(
                                                        fontSize: 17,
                                                      )),
                                                  Text(
                                                      lignecommand[index]
                                                          .article
                                                          .taille
                                                          .name
                                                          .toString()
                                                          .toUpperCase(),
                                                      style:
                                                          GoogleFonts.istokWeb(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        height: 1.15,
                                                      )),
                                                ]),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 10),
                                                child: Row(children: [
                                                  Text("Quantity",
                                                      style:
                                                          GoogleFonts.istokWeb(
                                                        fontSize: 20,
                                                      )),
                                                  Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10),
                                                    child: Text(
                                                        lignecommand[index]
                                                            .qteT
                                                            .toString(),
                                                        style: GoogleFonts
                                                            .istokWeb(
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        )),
                                                  ),
                                                ]),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 10),
                                                child: Row(
                                                  children: [
                                                    Text('Price:',
                                                        style: GoogleFonts
                                                            .istokWeb(
                                                          fontSize: 22,
                                                        )),
                                                    Text(
                                                        lignecommand[index]
                                                            .prix
                                                            .toString(),
                                                        style: GoogleFonts
                                                            .istokWeb(
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
                        Text(lignecommand[0].command.prixTotal.toString(),
                            style: GoogleFonts.istokWeb(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ),
                  TextButton(
                    // buttonprimaryinactivesmalltcr (9:1332)
                    onPressed: () {
                      MyStatic.orderDisplay = "displayOrder";
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BottomNavigationB(
                                    id: BoutiqueStatic.id,
                                    imglogo: BoutiqueStatic.imglogo,
                                    pageIndex: 4,
                                  )));
                      /*   checkConnected();
              MyStatic.total = total;
              print("in bag ${connect}"); */
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: Center(
                      child: Container(
                        margin:
                            EdgeInsets.only(left: 10, right: 10, bottom: 15),
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
                              'FERMER',
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
              )
            : Center(child: RefreshProgressIndicator()));
  }
}

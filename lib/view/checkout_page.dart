// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:mall/view/static/boutiqueStatic.dart';
import 'package:mall/view/static/static.dart';

import '../model/client.dart';
import '../model/inBag.dart';
import '../model/shippingInfo.dart';
import '../repository/client_repo.dart';
import '../repository/command_repo.dart';
import '../repository/ligne_command_repo.dart';
import '../view_model/client_view_model.dart';
import '../view_model/command_view_model.dart';
import '../view_model/ligne_command_view_mode.dart';
import 'bottom_navigation.dart';
import 'congrats_page.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  var commandRepository = CommandVM(commandRepo: CommandRepository());
  var clientRepository = ClientVM(clientRepo: ClientRepository());
  var lignecommandRepo = LigneCommandVM(lignecommandRepo: LigneCommandRepo());
  late ShippingInfo shipping;
  String tap = "";
  List<InBag> inn = [];

  Future<void> getBag() async {
    int qteT = 0;
    inn = MyStatic.inBagList;
    for (InBag i in inn) {
      qteT += i.qte;
    }
    List<Client> client = await clientRepository.getByEmail();
    //print("lisss ${client.first.id}");
    String id =
        await commandRepository.order(MyStatic.total, qteT, client.first.id);
    print('Command id: ' + id);
    lignecommandRepo.order(id);
  }

  @override
  void initState() {
    super.initState();
    shipping = MyStatic.shippingInfo.last;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Container(
          child: Text(
            'Checkout',
            style: GoogleFonts.istokWeb(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
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
      body: Container(
        margin: EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shipping address',
              style: GoogleFonts.istokWeb(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 130,
              child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 10,
                child: Container(
                  margin: EdgeInsets.only(left: 15, right: 30, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            shipping.name.toString(),
                            style: GoogleFonts.istokWeb(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Change',
                              style: GoogleFonts.istokWeb(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: Colors.red,
                              ),
                            ),
                          )
                        ],
                      ),
                      Text(
                        shipping.location.toString(),
                        style: GoogleFonts.istokWeb(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            shipping.city.toString(),
                            style: GoogleFonts.istokWeb(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            " " + shipping.zip.toString(),
                            style: GoogleFonts.istokWeb(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            ", " + shipping.state.toString(),
                            style: GoogleFonts.istokWeb(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Payment method',
              style: GoogleFonts.istokWeb(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    tap = "money";
                    setState(() {});
                  },
                  child: Container(
                    child: tap == 'money'
                        ? Image.asset(
                            'asset/checkbox.png',
                            width: 30,
                            height: 30,
                          )
                        : Image.asset(
                            'asset/!checkbox.png',
                            width: 30,
                            height: 30,
                          ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 10,
                  child: Container(
                    width: 80,
                    height: 60,
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: Image.asset(
                        'asset/money.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 10,
                  child: Container(
                    width: 80,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.asset(
                        'asset/paypal.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      tap = "paypal";
                      setState(() {});
                    },
                    child: Container(
                      child: tap == "paypal"
                          ? Image.asset(
                              'asset/checkbox.png',
                              width: 30,
                              height: 30,
                            )
                          : Image.asset(
                              'asset/!checkbox.png',
                              width: 30,
                              height: 30,
                            ),
                    )),
              ],
            ),
            SizedBox(
              height: 170,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Order:',
                      style: GoogleFonts.istokWeb(
                          fontSize: 22, color: Colors.grey)),
                  Text(MyStatic.total.toString(),
                      style: GoogleFonts.istokWeb(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Delivery:',
                      style: GoogleFonts.istokWeb(
                          fontSize: 22, color: Colors.grey)),
                  Text("15",
                      style: GoogleFonts.istokWeb(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Summary:',
                      style: GoogleFonts.istokWeb(
                          fontSize: 22, color: Colors.grey)),
                  Text((MyStatic.total + 15).toString(),
                      style: GoogleFonts.istokWeb(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
              // buttonprimaryinactivesmalltcr (9:1332)
              onPressed: () {
                getBag();
                BoutiqueStatic.success="success";
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BottomNavigationB(
                              id: BoutiqueStatic.id,
                              imglogo: BoutiqueStatic.imglogo,
                              pageIndex: 2,
                            )));
                /*  checkConnected();
                print("in bag ${connect}");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
               */
              },
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
                        'SUBMIT ORDER',
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
    );
  }
}

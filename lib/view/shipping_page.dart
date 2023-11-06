// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mall/model/shippingInfo.dart';
import 'package:mall/view/static/static.dart';

import '../model/State.dart';
import '../model/client.dart';
import '../repository/State_Repo.dart';
import '../repository/client_repo.dart';
import '../view_model/client_view_model.dart';
import '../view_model/state_view_model.dart';
import 'checkout_page.dart';

class ShippingPage extends StatefulWidget {
  const ShippingPage({super.key});

  @override
  State<ShippingPage> createState() => _ShippingPageState();
}

class _ShippingPageState extends State<ShippingPage> {
  var clientRepo = ClientVM(clientRepo: ClientRepository());
  var stateRepo = StateVM(stateRepo: StateRepository());

  List<StateModel> listOfStates = [];
  String selectedState = "";

  void listStates() async {
    listOfStates = await stateRepo.get();
    setState(() {
      selectedState = listOfStates.map((e) => e.name).first;
    });
  }

  TextEditingController txtName = TextEditingController();
  TextEditingController txtLocation = TextEditingController();
  TextEditingController txtCity = TextEditingController();
  TextEditingController txtState = TextEditingController();
  TextEditingController txtZip = TextEditingController();

  String print = "";
  bool validate(
      String name, String location, String city, String state, String zip) {
    if (name.isNotEmpty &&
        city.isNotEmpty &&
        location.isNotEmpty &&
        state.isNotEmpty &&
        zip.isNotEmpty &&
        zip.length >= 4) {
          MyStatic.shippingInfo=[];
      MyStatic.shippingInfo.add(ShippingInfo(name, location, city, state, zip));
      return true;
    }
    print = "Please enter a correct information.";
    return false;
  }

  List<StateModel> state = [];
  List<Client> list = [];
  Future<void> get() async {
    var client = await clientRepo.get();
    setState(() {
      list = client;
    });
  }

  @override
  void initState() {
    super.initState();
    get();
    listStates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Container(
          child: Text(
            'Add Shipping Adress',
            style: GoogleFonts.istokWeb(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        centerTitle: true,
      /*   leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.black,
          ),
        ), */
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                height: 40,
                child: print.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                print,
                                style: GoogleFonts.istokWeb(
                                  fontSize: 21,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            )),
                      )
                    : SizedBox(
                        height: 40,
                      ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: txtName,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Image.asset(
                        'asset/bottomNavigationBar_Icons/user.png',
                        width: 30,
                        height: 30),
                  ),
                  label: Text(
                    'Full Name',
                    style: GoogleFonts.istokWeb(fontSize: 22),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: txtLocation,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(11),
                    child: Image.asset('asset/location.png',
                        width: 30, height: 30),
                  ),
                  label: Text(
                    'Location',
                    style: GoogleFonts.istokWeb(fontSize: 22),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: txtCity,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(11),
                    child: Image.asset(
                      'asset/city.png',
                      width: 30,
                      height: 30,
                    ),
                  ),
                  label: Text(
                    'City',
                    style: GoogleFonts.istokWeb(fontSize: 22),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(11),
                    child: Image.asset(
                      'asset/map.png',
                      width: 30,
                      height: 30,
                    ),
                  ),
                  Text(
                    'State/Region :',
                    style: GoogleFonts.istokWeb(fontSize: 19,fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: DropdownButton(
                        borderRadius: BorderRadius.circular(5),
                        value: selectedState,
                        items: listOfStates.map((ls) {
                          return DropdownMenuItem(
                              value: ls.name,
                              child: Text(
                                ls.name,
                                style:  GoogleFonts.istokWeb(fontSize: 20,fontWeight: FontWeight.w700),
                              ));
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            selectedState = newVal!.toString();
                            //category.add() ;
                            state = listOfStates
                                .where(
                                    (element) => element.name == selectedState)
                                .toList();
                          });
                        }),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: txtZip,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(11),
                    child: Image.asset(
                      'asset/zip-code.png',
                      width: 30,
                      height: 30,
                    ),
                  ),
                  label: Text(
                    'Zip/Postal Code',
                    style: GoogleFonts.istokWeb(fontSize: 22),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              SizedBox(
                height: 110,
              ),
              TextButton(
                // buttonprimaryinactivesmalltcr (9:1332)
                onPressed: () {
                  if (validate(txtName.text, txtLocation.text, txtCity.text,
                          selectedState, txtZip.text) ==
                      true) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CheckOut()));
                  } else {
                    setState(() {});
                  }
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 15),
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
                          'SAVE ADDRESS',
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
      ),
    );
  }
}

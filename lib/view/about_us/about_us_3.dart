import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mall/view/home.dart';

class AboutUs3 extends StatelessWidget {
  const AboutUs3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(0),
        child: Container(
          // aboutus3Y7U (2:39)
          padding: EdgeInsets.fromLTRB(9, 80, 10, 41),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xfff9f9f9),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // autogroupqbxgbrS (SYt8uA2QPJJok4no66QBXg)
                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                width: double.infinity,
                height: 346,
                child: Stack(
                  children: [
                  /*   Positioned(
                      // rectangle2Xk6 (2:40)
                      left: 36,
                      top: 0,
                      child: Align(
                        child: SizedBox(
                          width: 173,
                          height: 91,
                          child: Image.asset(
                            'asset/mall.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ), */
                    Positioned(
                      // beepbeepfastdelivery1eZp (2:50)
                      left: 0,
                      top: 79,
                      child: Container(
                        width: 356,
                        height: 267,
                        child: Align(
                          // vectorzNn (2:51)
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            width: 404,
                            height: 267,
                            child: SvgPicture.asset(
                              'asset/about_us_3.svg',
                              width: 404,
                              height: 267,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // headlineJPU (2:45)
                margin: EdgeInsets.fromLTRB(1, 0, 0, 2),
                child: Text(
                  'Online Shopping',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.jacquesFrancois(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    height: 1.3175,
                    color: Color(0xff222222),
                  ),
                ),
              ),
              Container(
                // headlineor2 (2:46)
                margin: EdgeInsets.fromLTRB(0, 0, 0, 12),
                child: Text(
                  'Fastest Delivery',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.jacquesFrancois(
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                    height: 1.3175,
                    color: Color(0xff222222),
                  ),
                ),
              ),
              Container(
                // headlinesqt (2:49)
                margin: EdgeInsets.fromLTRB(0, 0, 0, 32),
                constraints: BoxConstraints(
                  maxWidth: 334,
                ),
                child: Text(
                  'Mall of Tunisia also guarantees you\nthe fastest delivery. You can return\nor exchange the product with respect\nto the period of 2 day’s.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.josefinSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    height: 1,
                    color: Color(0xff222222),
                  ),
                ),
              ),
              Container(
                // group89Hc (2:41)
                margin: EdgeInsets.fromLTRB(137, 0, 137, 25),
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // ellipse15wx (2:42)
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffd9d9d9),
                      ),
                    ),
                    SizedBox(
                      width: 11,
                    ),
                    Container(
                      // ellipse2QDY (2:43)
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffd9d9d9),
                      ),
                    ),
                    SizedBox(
                      width: 11,
                    ),
                    Container(
                      // ellipse3wzA (2:44)
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffff4750),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // buttonprimaryinactivebiggRx (2:47)
                margin: EdgeInsets.fromLTRB(7, 0, 6, 0),
                child: TextButton(
                  onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const Home(),
                        ),
                      );
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 48,
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
                      child: Text(
                        'NEXT',
                        style: GoogleFonts.istokWeb(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          height: 1.44,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

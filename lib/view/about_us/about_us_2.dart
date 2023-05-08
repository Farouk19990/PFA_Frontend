import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'about_us_3.dart';

class AboutUs2 extends StatelessWidget {
  const AboutUs2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: false,
      body: Container(
        // aboutus212a (2:24)
        padding: EdgeInsets.fromLTRB(2, 80, 0, 45),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xfff9f9f9),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // autogroup9kh84mY (9B5gjwnwfW3XTPpJeS9kH8)
              margin: EdgeInsets.fromLTRB(0, 0, 0, 23),
              width: 374,
              height: 343,
              child: Stack(
                children: [
                /*   Positioned(
                    // rectangle2PYv (2:25)
                    left: 43,
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
                    // moneyversebuyonline1Gsc (2:35)
                    left: 0,
                    top: 87,
                    child: Container(
                      width: 374,
                      height: 256,
                      child: Center(
                        // vectorzoc (2:36)
                        child: SizedBox(
                          width: 387.43,
                          height: 256,
                          child: SvgPicture.asset(
                            'asset/about_us_2.svg',
                            width: 387.43,
                            height: 256,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // headlinehi2 (2:30)
              margin: EdgeInsets.fromLTRB(0, 0, 3, 2),
              child: Text(
                'Easy Way To',
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
              // headlineZVL (2:31)
              margin: EdgeInsets.fromLTRB(0, 0, 3, 12),
              child: Text(
                'Make Payment',
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
              // headline5Tg (2:34)
              margin: EdgeInsets.fromLTRB(0, 0, 3, 52),
              constraints: BoxConstraints(
                maxWidth: 335,
              ),
              child: Text(
                'Mall of Tunisia guarantees you\nthe easiest way to pay while\nprotecting your personal information.',
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
              // group8nN6 (2:26)
              margin: EdgeInsets.fromLTRB(144, 0, 147, 10),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // ellipse1imY (2:27)
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
                    // ellipse2qrA (2:28)
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffff4750),
                    ),
                  ),
                  SizedBox(
                    width: 11,
                  ),
                  Container(
                    // ellipse3aok (2:29)
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffd9d9d9),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // buttonprimaryinactivebigvci (2:32)
              margin: EdgeInsets.fromLTRB(14, 0, 16, 0),
              child: TextButton(
                onPressed: () {
                     Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const AboutUs3(),
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
    );
  }
}

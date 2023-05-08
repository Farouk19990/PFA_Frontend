import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mall/view/home.dart';

import 'about_us_2.dart';

class AboutUs1 extends StatelessWidget {
  const AboutUs1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // aboutusAyg (2:9)
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xfff9f9f9),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // autogrouptaensNJ (9B5fQpLntaMQ36VBnatAeN)
              margin: EdgeInsets.fromLTRB(45, 80, 16, 23),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                 /*  Container(
                    // rectangle2PrS (2:10)
                    margin: EdgeInsets.fromLTRB(0, 0, 66, 0),
                    width: 173,
                    height: 91,
                    child: Image.asset(
                      'asset/mall.png',
                      fit: BoxFit.contain,
                    ),
                  ), */
                  TextButton(
                    // group26Ww4 (2:72)
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
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        color: Color(0xffff4d4c),
                        borderRadius: BorderRadius.circular(37.5),
                      ),
                      child: Center(
                        child: Text(
                          'skip',
                          style: GoogleFonts.istokWeb(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            height: 1.44,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // autogroup5mcnNTU (9B5g5Tu4ZVp9Lf6a945McN)
              margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
              width: double.infinity,
              height: 285,
              child: Stack(
                children: [
                  Positioned(
                    // shopaholicsonlinepromotions1Jr (2:15)
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 375,
                      height: 257,
                      child: Align(
                        // vectorqrr (2:16)
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 388.46,
                          height: 257,
                          child: SvgPicture.asset(
                            'asset/about_us_1.svg',
                            width: 388.46,
                            height: 257,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // headlineZ2A (2:17)
                    left: 88,
                    top: 252,
                    child: Align(
                      child: SizedBox(
                        width: 200,
                        height: 33,
                        child: Text(
                          'Welcome To The',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.jacquesFrancois(
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                            height: 1.3175,
                            color: Color(0xff222222),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // headlinedXp (2:19)
              margin: EdgeInsets.fromLTRB(0, 0, 0, 12),
              child: Text(
                'Mall of Tunisia',
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
              // headline9m4 (2:18)
              margin: EdgeInsets.fromLTRB(0, 0, 1, 0),
              constraints: BoxConstraints(
                maxWidth: 296,
              ),
              child: Text(
                'Mall of Tunisia is an online store.\nIt has 10K+ products. You can\nbuy easly buyvanything you \nwant. ',
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
              // autogrouphfnafUW (9B5gEHyge92WERJ9zjHfNA)
              padding: EdgeInsets.fromLTRB(16, 32, 16, 10),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // group8Bxe (2:11)
                    margin: EdgeInsets.fromLTRB(130, 0, 131, 10),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // ellipse1vvE (2:12)
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
                          // ellipse2Evv (2:13)
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
                          // ellipse3nSe (2:14)
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
                  TextButton(
                    // buttonprimaryinactivebigjcn (2:20)
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const AboutUs2(),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

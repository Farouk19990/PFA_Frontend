// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mall/model/article.dart';
import 'package:mall/view/static/boutiqueStatic.dart';
import 'package:mall/view/static/static.dart';

import '../repository/article_repo.dart';
import '../view_model/article_view_model.dart';

class ProductPage extends StatefulWidget {
  final int id;
  final String imglogo;
  const ProductPage({super.key, required this.id, required this.imglogo});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  var articleRepository = ArticleVM(articleRepository: ArticleRepository());
  List<List<String>> colorsAndSize = [];
  List<String> colorslist = [];
  List<String> sizelist = [];
  List<String> selectedTaille = [];
  List<String> selectedColor = [];
  String show = "";
  bool shouldShow = false;
  time() {
    if (show == "out of bounds") {
      setState(() {
        shouldShow = true;
      });
      Timer timer = Timer(Duration(seconds: 5), () {
        setState(() {
          shouldShow = false;
        });
      });
    }
  }

  Future<int> getArticle(int id, String size, String color) async {
    return await articleRepository.getArticlesIdByCouleurTaille(
        id, size, color);
  }

  void getColorsAndSizes() async {
    colorsAndSize =
        await articleRepository.getArticlesColorsAndSizes(widget.id);
    print("before state $colorsAndSize");
    setState(() {
      colorslist = colorsAndSize[0];
      sizelist = colorsAndSize[1];
    });
  }

  @override
  void initState() {
    super.initState();
    getColorsAndSizes();
  }

  @override
  Widget build(BuildContext context) {
    print("Build $colorslist");
    return FutureBuilder(
        future: articleRepository.getArticlesByProductId(widget.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Article>? produit = snapshot.data;
            MyStatic static = MyStatic();
            Map<String, Color> colors = static.convertStringToColor(colorslist);
            return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Wrap(
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 10, left: 120),
                          child: Text('Select Size',
                              style: GoogleFonts.istokWeb(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold))),
                      Container(
                        width: double.infinity,
                        child: SizedBox(
                            height: 85,
                            width: 350,
                            child: Wrap(
                              children: [
                                ...(sizelist).map((item) => Container(
                                      margin: EdgeInsets.fromLTRB(5, 1, 5, 1),
                                      padding: EdgeInsets.all(5),
                                      child: TextButton(
                                        style: !selectedTaille.contains(item)
                                            ? TextButton.styleFrom(
                                                backgroundColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color: Colors.black,
                                                        width: 2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)))
                                            : TextButton.styleFrom(
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        255, 255, 76, 76),
                                                shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color: Colors.black,
                                                        width: 2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12))),
                                        onPressed: () {
                                          setState(() {
                                            selectedTaille.clear();
                                            selectedTaille.add(item);
                                          });
                                        },
                                        child: Text(
                                          item.toUpperCase(),
                                          style: GoogleFonts.caladea(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ))
                              ],
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 70, left: 120),
                        child: Text('Select Color',
                            style: GoogleFonts.istokWeb(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        width: double.infinity,
                        child: SizedBox(
                            height: 100,
                            width: 200,
                            child: ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.horizontal,
                                itemCount: colors.length,
                                itemBuilder: (context, index) {
                                  String colorName =
                                      colors.keys.elementAt(index);
                                  Color? colorValue = colors[colorName];
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedColor.clear();
                                        selectedColor.add(colorName);
                                      });
                                    },
                                    child: Container(
                                        margin: EdgeInsets.all(5),
                                        width: 45,
                                        height: 45,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: colorValue,
                                            border: Border.all(
                                                color: Colors.black, width: 2)),
                                        child: selectedColor.contains(colorName)
                                            ? Image.asset(
                                                'asset/check-mark.png',
                                                color: colorName != "blanc"
                                                    ? Colors.white
                                                    : Colors.black,
                                              )
                                            : null),
                                  );
                                })),
                      ),
                      Center(
                        child: Container(
                            child: shouldShow
                                ? Text("Sorry,This article is out of stock.",
                                    style: GoogleFonts.istokWeb(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red))
                                : Container()),
                      ),
                      TextButton(
                        // buttonprimaryinactivesmalltcr (9:1332)
                        onPressed: () async {
                          BoutiqueStatic.success = "";
                          print('qte Stock :  ${produit!.first.qteStk}');
                          print('produit id ${produit.first.produitA.id}');
                          int articleId = await getArticle(
                              produit.first.produitA.id,
                              selectedTaille.first,
                              selectedColor.first);
                          print('yooo ${articleId}');
                          if (articleId != 0) {
                            static.makeInBagInstance(
                                articleId,
                                produit.first.produitA.image,
                                produit.first.produitA.name,
                                selectedColor,
                                selectedTaille,
                                produit.first.produitA.prix,
                                produit.first.qteStk);
                            Navigator.pop(context);
                          } else {
                            show = "out of bounds";
                            time();
                          }
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: Center(
                          child: Container(
                            margin: EdgeInsets.only(
                                left: 10, right: 10, bottom: 25),
                            width: double.infinity,
                            height: 55,
                            decoration: selectedTaille.isNotEmpty &&
                                    selectedColor.isNotEmpty
                                ? BoxDecoration(
                                    color: Color(0xffff4d4c),
                                    borderRadius: BorderRadius.circular(25),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x3fd32525),
                                        offset: Offset(0, 4),
                                        blurRadius: 4,
                                      ),
                                    ],
                                  )
                                : BoxDecoration(
                                    color: Colors.grey,
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
                                  'ADD TO CART',
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
                      ),
                    ],
                  )
                ]);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

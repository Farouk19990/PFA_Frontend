// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mall/model/sous_categorie.dart';
import 'package:mall/view/sous_categorie.dart';
import 'package:mall/view/static/static.dart';

import '../model/article.dart';
import '../model/categorie.dart';
import '../repository/article_repo.dart';
import '../repository/produit_repo.dart';
import '../view_model/article_view_model.dart';
import '../view_model/produit_view_model.dart';

class FilterPage extends StatefulWidget {
  final int? id;
  final String? imglogo;
  const FilterPage({super.key, this.id, this.imglogo});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  var articleRepository = ArticleVM(articleRepository: ArticleRepository());
  List<int> prices = [];
  Future<List<int>> getPrices() async {
    prices = await articleRepository.getPrices();
    return prices;
  }

  String minString = "";

  late RangeValues selectedRange;
  List<String> selectedColorIndex = [];
  List<String> selectedTaille = [];

  @override
  void initState() {
    super.initState();
    getPrices().then((value) {
      if (prices.isNotEmpty) {
        minString = prices.first.toString();
        selectedRange = RangeValues(double.parse(minString), prices.first + 50);
      }
    });
  }

  var produitRepository = ProduitVM(produitRepository: ProduitRepository());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
          margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    width: 160,
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Center(
                      child: Center(
                        child: Text(
                          'Discard',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.istokWeb(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            height: 1.4285714286,
                            color: Color(0xff222222),
                          ),
                        ),
                      ),
                    ),
                  )),
              TextButton(
                // buttonprimaryinactivesmalltcr (9:1332)
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  width: 160,
                  height: 45,
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
                        'Apply',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.istokWeb(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          height: 1.4285714286,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Container(
          margin: EdgeInsets.only(left: 50),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(1),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadiusDirectional.circular(10)),
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
                  child: Text('Filter',
                      style: GoogleFonts.istokWeb(color: Colors.black))),
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
      ),
      body: FutureBuilder(
          future: articleRepository.getArticles(),
          builder: (context, snapshot) {
              if(snapshot.data==null){
              return Container(child: Center(child: CircularProgressIndicator()),);
            }
            List<Article>? articles = snapshot.data;
            if (articles!.isEmpty) {
              return Container(
                child: Center(child:  Lottie.asset('asset/lottie/no-data.json'),
              ));
            }
            
            var color =
                articles.map((e) => e.couleur.name).toList().toSet().toList();
            MyStatic static = MyStatic();
            Map<String, Color> colors = static.convertStringToColor(color);
            List<String> tailles =
                articles.map((e) => e.taille.name).toList().toSet().toList();
            return Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Price range',
                      style: GoogleFonts.caladea(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  Container(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Card(
                          elevation: 10,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            child: SizedBox(
                              height: 50,
                              width: 350,
                              child: Column(
                                children: [
                                  Container(
                                    color: Colors.white,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${selectedRange.start.round().toString()} DT',
                                            style: GoogleFonts.caladea(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '${selectedRange.end.round().toString()} DT',
                                            style: GoogleFonts.caladea(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ]),
                                  ),
                                  Expanded(
                                    child: Container(
                                      color: Colors.white,
                                      child: RangeSlider(
                                        min: 0,
                                        max: 500,
                                        //divisions: 30,
                                        inactiveColor: Colors.grey,
                                        activeColor:
                                            Color.fromARGB(255, 255, 76, 76),
                                        labels: RangeLabels(
                                          selectedRange.start
                                              .round()
                                              .toString(),
                                          selectedRange.end.round().toString(),
                                        ),
                                        values: selectedRange,
                                        onChanged: (RangeValues newRange) {
                                          setState(() {
                                            selectedRange = newRange;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Colors ',
                      style: GoogleFonts.caladea(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: double.infinity,
                    child: Card(
                      elevation: 10,
                      child: SizedBox(
                          height: 50,
                          width: 350,
                          child: ListView.builder(
                            
                              scrollDirection: Axis.horizontal,
                              itemCount: colors.length,
                              itemBuilder: (context, index) {
                                  String colorName = colors.keys.elementAt(index);
                                  Color? colorValue = colors[colorName];
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (selectedColorIndex.contains(colorName)) {
                                        selectedColorIndex.remove(colorName);
                                      } else {
                                        selectedColorIndex.add(colorName);
                                      }
                                    });
                                  },
                                  child: Container(
                                      margin: EdgeInsets.all(5),
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: colorValue,
                                      ),
                                      child: selectedColorIndex.contains(colorName)
                                          ? Image.asset(
                                              'asset/check-mark.png',
                                              color: Colors.white,
                                            )
                                          : null),
                                );
                              })),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Taille ',
                      style: GoogleFonts.caladea(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: double.infinity,
                    child: Card(
                      elevation: 10,
                      child: SizedBox(
                          height: 50,
                          width: 350,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: tailles.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.fromLTRB(5, 1, 5, 1),
                                  padding: EdgeInsets.all(5),
                                  child: TextButton(
                                    style:
                                        !selectedTaille.contains(tailles[index])
                                            ? TextButton.styleFrom(
                                                backgroundColor: Colors.grey,
                                                shape: StadiumBorder())
                                            : TextButton.styleFrom(
                                                backgroundColor: Color.fromARGB(
                                                    255, 255, 76, 76),
                                                shape: StadiumBorder()),
                                    onPressed: () {
                                      setState(() {
                                        if (selectedTaille
                                            .contains(tailles[index])) {
                                          selectedTaille.remove(tailles[index]);
                                        } else {
                                          selectedTaille.add(tailles[index]);
                                        }
                                      });
                                    },
                                    child: Text(
                                      tailles[index].toUpperCase(),
                                      style: GoogleFonts.caladea(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                );
                              })),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Sous Categorie ',
                      style: GoogleFonts.caladea(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: double.infinity,
                    child: SizedBox(
                        height: 70,
                        width: 350,
                        child: Card(
                          elevation: 10,
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SousCategoriePage(
                                            id: widget.id,
                                            imglogo: widget.imglogo,
                                          )));
                            },
                            trailing: Image.asset(
                              'asset/right-arrow.png',
                              height: 32,
                              width: 32,
                            ),
                            title: FutureBuilder(
                                future: produitRepository
                                    .sousCategorieByCategorie(widget.id),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    List<String>? listOfData = snapshot.data;
                                    return ListView.builder(
                                        itemCount: listOfData!.length,
                                        itemBuilder: ((context, index) => Text(
                                              listOfData[index],
                                              style: GoogleFonts.caladea(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            )));
                                  }
                                  return Container(
                                    child: Text('Aucune Sous Categorie',
                                        style: GoogleFonts.caladea(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                  );
                                }),
                          ),
                        )),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

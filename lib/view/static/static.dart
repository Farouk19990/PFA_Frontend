import 'dart:ui';

import 'package:flutter/material.dart';

import '../../model/inBag.dart';

class MyStatic {
  static List<String> selectedNAMEsousCategorie = [];
  static String selectedCategorie = "";
  static String catOrsubCat = "";
  static List<int> listOfProductID = [];
  Map<String, Color> convertStringToColor(List<String> string) {
    Map<String, Color> colorMap = {};
    for (var i in string) {
      switch (i) {
        case "noir":
          colorMap['noir'] = Colors.black;
          break;
        case "Beige":
          colorMap['Beige'] = Colors.brown;
          break;
        case "red":
          colorMap['red'] = Colors.red;
          break;
        case "blue":
          colorMap['blue'] = Colors.blue;
          break;
        case "green":
          colorMap['green'] = Colors.green;
          break;
        // Add more cases for additional key-value pairs as needed
        default:
          colorMap[i] =
              Colors.black; // Default color if the key is not recognized
      }
    }
    return colorMap;
  }

  static List<InBag> inBagList = [];
  void makeInBagInstance(String imgUrl, String productName, List<String> colors,
      List<String> sizes,int price) {
    for (var i = 0; i < colors.length && i < sizes.length; i++) {
      InBag inBag = InBag(imgUrl, productName, colors[i], sizes[i],price,1);
      inBagList.add(inBag);
    }
  }
}

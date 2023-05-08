import 'dart:ui';

import 'package:flutter/material.dart';

class MyStatic{
  static List<String> selectedNAMEsousCategorie =[];
  static String selectedCategorie="";
  static String catOrsubCat="";
  static List<int> listOfProductID=[];
  
  List<Color> convertStringToColor(List<String> string) {
    List<Color> colors = [];
    for (var i in string) {
      switch (i) {
        case "noir":
          colors.add(Colors.black);
          break;
        case "Beige":
          colors.add(Colors.brown);
          break;
      }
    }
    return colors;
  }
}
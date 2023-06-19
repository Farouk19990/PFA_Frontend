import 'dart:ui';

import 'package:flutter/material.dart';

import '../../model/inBag.dart';
import '../../model/shippingInfo.dart';

class MyStatic {
  static List<String> selectedNAMEsousCategorie = [];
  static String selectedCategorie = "";
  static String catOrsubCat = "";
  static List<int> listOfProductID = [];
  static String staticT = "";
  static List<ShippingInfo> shippingInfo = [];
  static int total = 0;

  static String goingToTheShipping = "";

  static String userEmail = "";
  static int userID = 0;
  static String orderDisplay = "";

  Map<String, Color> convertStringToColor(List<String> string) {
    Map<String, Color> colorMap = {};
    for (var i in string) {
      switch (i) {
        case "noir":
          colorMap['noir'] = Colors.black;
          break;
        case "marron":
          colorMap['marron'] = Colors.brown;
          break;
        case "blanc":
          colorMap['blanc'] = Colors.white;
          break;
        case "bleu":
          colorMap['bleu'] = Colors.blue;
          break;
        case "jeune":
          colorMap['jeune'] = Colors.yellow;
          break;
        case "vert":
          colorMap['vert'] = Colors.green;
          break;
        case "Beige":
          colorMap['Beige'] = Colors.brown.shade100;
          break;
        case "rose":
          colorMap['rose'] = Colors.pink;
          break;
        case "rouge":
          colorMap['rouge'] = Colors.red;
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
  static List<InBag> favoriteList = [];
  void makeInBagInstance(int id, String imgUrl, String productName,
      List<String> colors, List<String> sizes, int price, int qteMax) {
    for (InBag i in inBagList) {
      print("here");
      if (id == i.id && sizes.first == i.size && colors.first == i.color) {
        i.setQte(i.qte + 1);
        return;
      }
    }
    InBag inBag = InBag(
        id, imgUrl, productName, colors.first, sizes.first, price, 1, qteMax);
    inBagList.add(inBag);
  }
}

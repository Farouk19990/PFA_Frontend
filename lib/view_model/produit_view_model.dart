// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mall/model/produits.dart';
import 'package:mall/repository/boutique_repo.dart';
import 'package:mall/repository/produit_repo.dart';

import '../model/article.dart';
import '../view/static/static.dart';

class ProduitVM {
  final ProduitRepository produitRepository;
  ProduitVM({
    required this.produitRepository,
  });

  Future<List<Produit>> fetchData() async {
    return await produitRepository.getProduits();
  }

  Future<List<Produit>> data(int? id) async {
    var listOfProduits = await produitRepository.getProduits();
    List<Produit> lists =
        listOfProduits.where((element) => element.boutique!.id == id).toList();
    return lists;
  }

  Future<List<String>> sousCategorieByCategorie(int? id) async {
    List<String> listSousCategorie = [];
    var listOfProduits = await data(id);
    var list=listOfProduits.map((element) {
      if (element.sousCategorie.categorie.name == MyStatic.selectedCategorie) {
        if (!listSousCategorie.contains(element.sousCategorie.name)) {
          listSousCategorie.add(element.sousCategorie.name);
        }
      }
    }).toList();
    var liste=listOfProduits.where((element) => element.sousCategorie.categorie.name == MyStatic.selectedCategorie).toList();
    //print('LISTEEE article::  ${liste.map((e) => e.articles).toList()}');
    return listSousCategorie;
  }
  void getArticle(int? id) async {
    var listOfProduits = await data(id);
    var liste=listOfProduits.where((element) => element.sousCategorie.categorie.name == MyStatic.selectedCategorie).toList();
    var articles=liste.map((e) => e.articles).toList();
    Map map=jsonDecode(articles.first);
    //print('ARTICLE:: ${map}');
  }
/* 
  Future<List<String>> sousCategorie(int? id) async {
    List<String> listSousCategorie = [];
    var listOfProduits = await produitRepository.getProduits();
    listOfProduits.map(
      (e) {
        if (e.boutique?.id == id) {
          if (!listSousCategorie.contains(e.sousCategorie.name)) {
            listSousCategorie.add(e.sousCategorie.name);
          }
        }
      },
    ).toList();
    //print('list sous Categories :: $listSousCategorie');
    return listSousCategorie;
  } */

  Future<List<Produit>> giveMeMethode(int? id) async {
    print(MyStatic.catOrsubCat);
    if (MyStatic.catOrsubCat == "category") {
      return await chercher(id);
    }
    return await chercherCategorie(id);
  }

  Future<List<Produit>> chercher(int? id) async {
    //List SousCategorie selon boutique
    List<String> lis = MyStatic.selectedNAMEsousCategorie;
    var listE = await chercherCategorie(id);
    var list = listE
        .where(
          (element) => lis.contains(element.sousCategorie.name),
        )
        .toList();
    // print('cherecher $list');
    return list;
  }

  Future<List<Produit>> chercherCategorie(int? id) async {
    //List Categorie selon boutique
    List<String> listSousCategorie = [];
    String selectedName = MyStatic.selectedCategorie;
    var listOfProduits = await produitRepository.getProduits();
    var listBoutique =
        listOfProduits.where((element) => element.boutique!.id == id).toList();
    var list = listBoutique
        .where((e) => e.sousCategorie.categorie.name == selectedName)
        .toList();
    print(list);
    return list;
  }
}

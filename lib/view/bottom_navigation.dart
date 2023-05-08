// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mall/view/bag_page.dart';
import 'package:mall/view/home.dart';
import 'package:mall/view/profile_page.dart';
import 'package:mall/view/shop_page.dart';

import 'favorite_page.dart';
import 'main_page.dart';

class BottomNavigationB extends StatefulWidget {
  final int? id;
  final String? imglogo;
  final int? pageIndex;
  const BottomNavigationB({super.key, this.id, this.imglogo, this.pageIndex});

  @override
  State<BottomNavigationB> createState() => _BottomNavigationBState();
}

class _BottomNavigationBState extends State<BottomNavigationB> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = widget.pageIndex!;
  }

  List<Widget> _screens() => [
        MainPage(id: widget.id, imglogo: widget.imglogo),
        ShopPage(id: widget.id, imglogo: widget.imglogo),
        BagPage(),
        FavoritePage(),
        ProfilePage()
      ];
  late int currentIndex;
  Color selected = Colors.redAccent;
  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = _screens();
    return Scaffold(
      // extendBodyBehindAppBar: true,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
              selectedItemColor: selected,
              currentIndex: currentIndex,
              selectedFontSize: 15,
              onTap: (index) => setState(() {
                    currentIndex = index;
                  }),
              items: [
                BottomNavigationBarItem(
                  icon: GestureDetector(
                    onDoubleTap: () {
                      setState(() {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      });
                    },
                    child: Image.asset(
                      "asset/bottomNavigationBar_Icons/home.png",
                      height: 45,
                      width: 45,
                      color: currentIndex == 0 ? selected : Colors.black,
                    ),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset("asset/bottomNavigationBar_Icons/shop.png",
                      height: 45,
                      width: 45,
                      color: currentIndex == 1 ? selected : Colors.black),
                  label: 'Shop',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset("asset/bottomNavigationBar_Icons/bag.png",
                      height: 45,
                      width: 45,
                      color: currentIndex == 2 ? selected : Colors.black),
                  label: 'Bag',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset("asset/bottomNavigationBar_Icons/love.png",
                      height: 45,
                      width: 45,
                      color: currentIndex == 3 ? selected : Colors.black),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset("asset/bottomNavigationBar_Icons/user.png",
                      height: 45,
                      width: 45,
                      color: currentIndex == 4 ? selected : Colors.black),
                  label: 'Profile',
                ),
              ]),
        ),
      ),
      body: screens[currentIndex],
    );
  }
}

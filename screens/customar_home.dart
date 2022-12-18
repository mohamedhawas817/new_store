import 'package:flutter/material.dart';
import './category.dart';
import './home.dart';
import './profile.dart';
import './shop.dart';
import './shop_cart.dart';
import './stores.dart';



class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  int _selectPageIndex = 0;

  List<Map> _pages = [
    {'page': Homy(), 'title': "home"},
    {'page': Category(), 'title': "Category"},
    {'page': Store(), 'title': "Store"},
    {'page': Shopping_cart(), 'title': "shopping_cart"},
    {'page': Profile(), 'title': "profile"},
  ];

  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
    print(_pages[3]['page'].runtimeType);

  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child: Scaffold(
      body: _pages[_selectPageIndex]['page'] ,
      bottomNavigationBar: BottomNavigationBar(

        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.blue,
        currentIndex: _selectPageIndex,
        showSelectedLabels: true,
        onTap: _selectPage,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home",  ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Category" ),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: "Stores" ),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart" ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile" )
        ],
      ),
    ));
  }
}


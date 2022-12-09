import 'package:flutter/material.dart';
import './screens/category.dart';
import './screens/home.dart';
import './screens/profile.dart';
import './screens/shop.dart';
import './screens/shop_cart.dart';
import './screens/stores.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "homey": (context) => Homy(),
        "category": (context) => Category(),
        "shopping_cart": (context) => Shopping_cart(),
        "profile": (context) => Profile(),
        "Store": (context) => Store(),


      },
      home: HomePage(),
    );
  }
}

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


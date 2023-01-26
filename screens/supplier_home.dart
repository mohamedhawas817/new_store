import 'package:flutter/material.dart';
import './category.dart';
import './home.dart';
import './profile.dart';
import './shop.dart';
import './shop_cart.dart';
import './stores.dart';
import './dashboard.dart';
import './upload_product.dart';

class SupplierHome extends StatefulWidget {

  @override
  State<SupplierHome> createState() => _SupplierHomeState();
}

class _SupplierHomeState extends State<SupplierHome> {



  int _selectPageIndex = 0;

  List<Map> _pages = [
    {'page': Homy(), 'title': "home"},
    {'page': Category(), 'title': "Category"},
    {'page': Store(), 'title': "Store"},
    {'page': Dashboard(), 'title': "dashboard"},
    {'page': UploadProduct(), 'title': "upload"},
  ];

  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });

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
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Dashboard" ),
          BottomNavigationBarItem(icon: Icon(Icons.upload), label: "upload" )
        ],
      ),
    ));
  }
}


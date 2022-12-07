import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './search_screen.dart';
import '../widget/fake_search.dart';

class Homy extends StatefulWidget {
  const Homy({Key? key}) : super(key: key);

  @override
  State<Homy> createState() => _HomyState();
}

class _HomyState extends State<Homy> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Fakesearch(),
          elevation: 0,
          bottom: TabBar(
            indicatorWeight:8 ,
            indicatorColor:Colors.yellow ,
            isScrollable: true,
            tabs: [
              Taby('Men'),
              Taby('Women'),
              Taby('Shoes'),
              Taby('Bags'),
              Taby('Electronics'),
              Taby('Accessories'),
              Taby('Home'),
              Taby("Kids"),
              Taby("Beauty")



            ],
          ),


        ),
        body: TabBarView(children: [
          Center(child: Text("Men Screen "),),
          Center(child: Text("Women Screen "),),
          Center(child: Text("Shoes Screen "),),
          Center(child: Text("Bags Screen "),),
          Center(child: Text("Electronics Screen "),),
          Center(child: Text("Accessories Screen "),),
          Center(child: Text("Home Screen "),),
          Center(child: Text("Kids Screen "),),
          Center(child: Text("Beauty Screen "),),



        ],),
      ),
    );
  }
}



class Taby extends StatelessWidget {

  String title;


  Taby(this.title);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(title, style: TextStyle(color: Colors.grey.shade600),

      ),
    );
  }
}


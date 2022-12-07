import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class SearchSCreen extends StatefulWidget {
  const SearchSCreen({Key? key}) : super(key: key);

  @override
  State<SearchSCreen> createState() => _SearchSCreenState();
}

class _SearchSCreenState extends State<SearchSCreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0 ,
      title: CupertinoSearchTextField(),
      leading: IconButton(icon: Icon(Icons.arrow_back_ios_new), color:Colors.black, onPressed: ()=> Navigator.pop(context),  ),
    ),);
  }
}

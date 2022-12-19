import 'package:flutter/material.dart';



class My_store extends StatelessWidget {
  const My_store({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Store",style: TextStyle(color: Colors.black),),
      ),
    );
  }
}

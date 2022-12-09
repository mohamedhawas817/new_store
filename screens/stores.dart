import 'package:flutter/material.dart';


class Store extends StatelessWidget {
  const Store({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title:Text("Stores", style: TextStyle(color: Colors.black),),

      ),
    );
  }
}

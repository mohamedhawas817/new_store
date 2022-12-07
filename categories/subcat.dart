import 'package:flutter/material.dart';



class Subcat extends StatelessWidget {

  String label='';
  String mainCat= '';
  Subcat(this.label, this.mainCat);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(label),),
      body: Center(child: Text(mainCat),),
    );
  }
}

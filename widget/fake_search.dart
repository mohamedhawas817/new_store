import 'package:flutter/material.dart';
import '../screens/search_screen.dart';

class Fakesearch extends StatelessWidget {
  const Fakesearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchSCreen()));
      },
      child: Container(
        height: 35,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.yellow, width: 4.4),
            borderRadius: BorderRadius.circular(25)
        ),
        child: Row(
          children: [
          Icon(Icons.search, color: Colors.grey,),
          Text("What Are You Looking For",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          // Container(
          //   height: 32,
          //   width: 75,
          //   child: Text("Search",
          //     style: TextStyle(fontSize: 16, color: Colors.grey),
          //   ),
          //   decoration: BoxDecoration(color: Colors.yellow, borderRadius: BorderRadius.circular(25)),
          // )
        ],),
      ),
    );
  }
}
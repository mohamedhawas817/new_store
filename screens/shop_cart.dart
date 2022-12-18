import 'package:flutter/material.dart';
import '../main.dart';
import './customar_home.dart';

class Shopping_cart extends StatelessWidget {
  const Shopping_cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.delete_forever, color: Colors.black,))
      ],
      title: Text("shopping_Cart"),),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Your Cart Is Empty", style: TextStyle(fontSize: 30),),
          Material(
            borderRadius: BorderRadius.circular(25),
            color: Colors.lightBlueAccent,
            child: MaterialButton(
              minWidth: MediaQuery.of(context).size.width * 0.6,
                onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
                },
              child: Text("continue shopping", style: TextStyle(fontSize: 18, color: Colors.white),)
            ),
          ),

        ],
      ),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Total \$', style: TextStyle(fontSize: 18),),
          Text('00.00', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color:Colors.red),),
          Container(
            height: 35,
            width: MediaQuery.of(context).size.width *0.45,
            decoration: BoxDecoration(
                color:Colors.yellow,
              borderRadius: BorderRadius.circular(25),

            ),
            child: MaterialButton(
              onPressed: (){},
              child: Text("Check Out"),
            ),
          )

        ],
      ),

    );
  }
}

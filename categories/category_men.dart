import 'package:flutter/material.dart';
import 'package:shop/screens/category.dart';
import './categ_list.dart';
import './subcat.dart';

class Category_men extends StatelessWidget {

  // List<String> mens = [
  //   'shirt',
  //   'jeans',
  //   'shoes',
  //   'jacket'
  //
  // ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Stack(
        children: [Positioned(
          left: 0,
          bottom: 0,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.75,
            child: Column(
              crossAxisAlignment:  CrossAxisAlignment.start,
              children: [

                Text(
                  "Men",
                  style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5
                ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.68,
                  child:
                  GridView.count(
                    crossAxisCount: 3,
                    mainAxisSpacing: 70,
                    crossAxisSpacing: 15,
                    children:
                      List.generate(men.length, (index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Subcat(men[index], 'men'))),

                              child: SizedBox(
                                height:70,
                              width: 70,
                              child: Image(image: AssetImage('assets/images/men$index.jpg'),),

                              ),
                            ),
                            Expanded(child: Text(men[index]))
                          ],
                        );
                      }),

                  )
                  ,
                ),

              ],
            ),
          ),
        ),
          Positioned(
            bottom: 0,
              right: 0 ,
              child: SizedBox(
            height: MediaQuery.of(context).size.height *0.8,
            width: MediaQuery.of(context).size.width * 0.05,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Container(
                child: RotatedBox(quarterTurns: 3, child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    Text("<<", style: TextStyle(color: Colors.brown, fontSize: 16, letterSpacing: 10 ,fontWeight: FontWeight.w600),),
                    Text("men".toUpperCase() , style: TextStyle(color: Colors.brown, fontSize: 16, letterSpacing: 10 ,fontWeight: FontWeight.w600),),
                    Text(">>", style: TextStyle(color: Colors.brown, fontSize: 16, letterSpacing: 10 ,fontWeight: FontWeight.w600),)


                  ],), ),
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                  color: Colors.brown.withOpacity(0.2)),

              ),
            ),
          )
          )
      ]
      ),
    );

  }
}

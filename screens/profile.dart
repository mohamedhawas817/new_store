import 'package:flutter/material.dart';
import '../widget/profileheader.dart';
import '../customar_screen/wishlist.dart';
import '../customar_screen/customar_order.dart';
import './shop_cart.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            expandedHeight:   140,
            flexibleSpace:
            LayoutBuilder(builder: (context, contr){
              return FlexibleSpaceBar(

                title: AnimatedOpacity(

                  duration: Duration(milliseconds: 200),
                  opacity: contr.biggest.height <=120 ? 1 : 0,
                  child: Text('Account', style: TextStyle(color: Colors.black),),
                ),
                background: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25, left: 30),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('assets/images/guest.jpg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Text("guest".toUpperCase(), style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600
                          ),),
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.yellow, Colors.brown]
                    )
                  ),
                ),
              );

            },
            ),

          ),
          SliverToBoxAdapter(child: Column(
            children: [
              Container(height: 80, width: MediaQuery.of(context).size.width * 0.9 ,decoration: BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30) ,bottomLeft: Radius.circular(30)
                          )
                        ),
                        child: TextButton(
                          child: SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Center(child: Text('Cart', style: TextStyle(color: Colors.yellow, fontSize: 24),)),
                          ),
                          onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> Shopping_cart() )),

                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                            color: Colors.yellowAccent,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30) ,bottomLeft: Radius.circular(30)
                            )
                        ),
                        child: TextButton(

                          child: SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Center(child: Text('Orders', style: TextStyle(color: Colors.black, fontSize: 24),)),
                          ),
                          onPressed:()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> Customar_order() )),
                        ),
                      ),


                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30) ,bottomLeft: Radius.circular(30)
                            )
                        ),
                        child: TextButton(
                          child: SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Center(child: Text('WishList', style: TextStyle(color: Colors.yellow, fontSize: 24),)),
                          ),
                          onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> Wishlist() )),
                        ),
                      ),


                    ],
                  )

              ),
              SizedBox(
                height: 150,
                child: Image(image: AssetImage('assets/images/logo.jpg'),),
              ),
              profileHeader('Account Info.  '),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 260,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Column(
                    children: [
                      listtile('Email Address ', 'examle@mail.com', Icon(Icons.email)),
                      devide(),
                      listtile("Phone No", "+111111", Icon(Icons.call)),
                      devide(),
                      listtile("Address", "140 street - New Jerssy", Icon(Icons.home)),

                    ],
                  ),
                ),
              ),
              profileHeader('Account Settings.  '),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 260,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: Column(
                    children: [
                      listtile('Edit profile ', '', Icon(Icons.edit)),
                      devide(),
                      listtile("Change Password", "", Icon(Icons.lock)),
                      devide(),
                      listtile("Log out", '' ,Icon(Icons.logout)),

                    ],
                  ),
                ),
              ),


            ],
          ),)
        ],
      ),
    );
  }
}






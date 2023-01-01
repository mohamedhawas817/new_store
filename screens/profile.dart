import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widget/profileheader.dart';
import '../customar_screen/wishlist.dart';
import '../customar_screen/customar_order.dart';
import './shop_cart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final docmentId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {


    return FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance.collection('customars').doc(docmentId).get(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshop ) {
            if(snapshop.hasError) {
              return Text("Something went wrong");
            }

            if(snapshop.hasData && !snapshop.data!.exists) {
              return Center(child: Text("Document  Doesnot exist"),);
            }

            if(snapshop.connectionState == ConnectionState.done) {
              Map<String, dynamic> data = snapshop.data!.data() as Map<String, dynamic>;

              return  Scaffold(
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
                                  data['profile_omage'] == null ?  CircleAvatar(
                                    radius: 50,
                                    backgroundImage: NetworkImage(data['profile_image']),
                                  ) : CircleAvatar(
                                    radius: 50,
                                    backgroundImage: AssetImage('assets/images/guest.jpg'),
                                  ) ,
                                  Padding(
                                    padding: const EdgeInsets.only(left: 25),
                                    child: Text( data['name']!=null ? data['name'].toUpperCase(): '', style: TextStyle(
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
                                      child: Center(child: Text('Orders', style: TextStyle(color: Colors.black, fontSize: 18),)),
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
                                      child: Center(child: Text('WishList', style: TextStyle(color: Colors.yellow, fontSize: 18),)),
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
                                listtile('Email Address ', data['email'], Icon(Icons.email), (){}),
                                devide(),
                                listtile("Phone No", data['phone'], Icon(Icons.call), (){}),
                                devide(),
                                listtile("Address", data['address'], Icon(Icons.home), (){}),

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
                                listtile('Edit profile ', '', Icon(Icons.edit), (){}),
                                devide(),
                                listtile("Change Password", "", Icon(Icons.lock),(){}),
                                devide(),
                                listtile("Log out", '' ,Icon(Icons.logout), () async {
                                  await FirebaseAuth.instance.signOut();
                                  Navigator.pushReplacementNamed(context, 'welcome_screen');
                                }),

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
            else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
        }
    );


  }
}






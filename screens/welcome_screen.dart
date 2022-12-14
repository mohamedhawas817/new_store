import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';


import 'package:flutter/material.dart';
import '../widget/yallow_button.dart';


final mycolors = [
  Colors.yellowAccent,
  Colors.red,
  Colors.blueAccent,
  Colors.green,
  Colors.purple,
  Colors.teal
];




class WelcomeSCreen extends StatefulWidget {
  const WelcomeSCreen({Key? key}) : super(key: key);

  @override
  State<WelcomeSCreen> createState() => _WelcomeSCreenState();
}

class _WelcomeSCreenState extends State<WelcomeSCreen> with SingleTickerProviderStateMixin  {


  late AnimationController animated_controller;

  bool processing = false;

  @override
  void initState() {
    // TODO: implement initState
    animated_controller = AnimationController(vsync: this, duration: const Duration( seconds: 2));
    animated_controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animated_controller.dispose();
    super.dispose();
  }

  final colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  final colorizeTextStyle = TextStyle(
    fontSize: 50.0,
    fontFamily: 'Horizon',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/bgi.jpg')
            )
          ),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                

            //   SizedBox(
            //   width: 250.0,
            //   child: DefaultTextStyle(
            //     style: const TextStyle(
            //       fontSize: 30.0,
            //       fontFamily: 'Bobbers',
            //     ),
            //     child: AnimatedTextKit(
            //       animatedTexts: [
            //         TyperAnimatedText('Welcome', speed: Duration(milliseconds: 200)),
            //
            //       ],
            //       onTap: () {
            //         print("Tap Event");
            //       },
            //     ),
            //   ),
            // ),



                AnimatedTextKit(

                  animatedTexts: [
                    ColorizeAnimatedText(
                        "Welcome", textStyle: TextStyle(
                        fontSize: 45,
                      fontWeight: FontWeight.bold,
                      fontFamily:  'Acme'),
                        colors: mycolors
                    ),
                    ColorizeAnimatedText(
                        "To", textStyle: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        fontFamily:  'Acme'),
                        colors: mycolors
                    ),

                    ColorizeAnimatedText(
                        "My Store", textStyle: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        fontFamily:  'Acme'),
                        colors: [
                          Colors.yellowAccent,
                          Colors.red,
                          Colors.blueAccent,
                          Colors.green,
                          Colors.purple,
                          Colors.teal
                        ]
                    )
                  ],
                  isRepeatingAnimation: true,
                  repeatForever: true,


                ),
                SizedBox(
                  height: 120,
                  width: 200,
                  child: Image(image: AssetImage('assets/images/logo.jpg'),),
                ),
        SizedBox(
          width: 250.0,
          child: DefaultTextStyle(
            style: const TextStyle(
              fontSize: 40.0,
              fontFamily: 'Canterbury',
              color: Colors.lightBlueAccent
            ),
            child: AnimatedTextKit(

              animatedTexts: [
                ScaleAnimatedText('Buy'),
                ScaleAnimatedText('Shop'),
                ScaleAnimatedText('My Store'),
              ],
              onTap: () {
                print("Tap Event");
              },
            ),
          ),
        ),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.end,
                 children: [
                   Container(
                     decoration: BoxDecoration(
                         color: Colors.white38,
                         borderRadius: BorderRadius.only(
                             topLeft: Radius.circular(50),
                             bottomLeft: Radius.circular(50)
                         )
                     ),
                     child: Padding(
                       padding: EdgeInsets.all(12),
                       child: Text("Suppliers only", style: TextStyle(color: Colors.yellowAccent, fontSize: 30, fontWeight: FontWeight.w600),),


                     ),
                   ),
                   SizedBox(height: 6,),
                   Container(
                     height: 60,
                     width: MediaQuery.of(context).size.width * 0.9,
                     decoration: BoxDecoration(
                       color: Colors.white38,
                       borderRadius: BorderRadius.only(
                           topLeft: Radius.circular(50),
                           bottomLeft: Radius.circular(50)
                       ),

                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         animatedimage(animated_controller: animated_controller),
                         YollowButton(0.25, 'Log In', (){
                           Navigator.pushReplacementNamed(context, "supp_login");
                         }),
                         YollowButton(0.35, 'Sign Up', (){
                           Navigator.of(context).pushNamed("supp_Signup");
                         }),
                       ],
                     ),
                   ),

                 ],
               ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50)
                      ),

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        YollowButton(0.25, 'Log In', (){
                          Navigator.pushReplacementNamed(context, "customar_signIn");
                        }),
                        YollowButton(0.35, 'Sign Up', (){
                          Navigator.of(context).pushNamed("signup");
                        }),
                        animatedimage(animated_controller: animated_controller),
                      ],
                    ),
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white38
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      googlefacebook("Google", (){}, Image(
                        image: AssetImage('assets/images/google.jpg'),
                      ), ),

                      googlefacebook("Facebook", (){}, Image(
                        image: AssetImage('assets/images/facebook.jpg'),
                      ), ),

                      processing == true ? CircularProgressIndicator() :  googlefacebook("Guest", () async {

                        setState(() {

                          processing = true;

                        });
                        try {
                          await FirebaseAuth.instance.signInAnonymously();
                          FirebaseFirestore.instance.collection('customars').doc(FirebaseAuth.instance.currentUser!.uid).set({
                            'store_name': '',
                            'email': '',
                            'store_logo' : '',
                            'phone': '',
                            'address': '',
                            'cid': FirebaseAuth.instance.currentUser!.uid,
                            'cover_image': ''
                          });
                        }catch(e) {
                          throw e;
                        }

                        Navigator.pushReplacementNamed(context, "customarhome");

                      }, Icon(Icons.person
                      ), )

                    ],
                  ),
                )



              ],
            ),
          ),
        ),

    );
  }
}

class animatedimage extends StatelessWidget {
  const animatedimage({
    Key? key,
    required this.animated_controller,
  }) : super(key: key);

  final AnimationController animated_controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animated_controller.view,
        builder: (context, child){
        return Transform.rotate(angle: animated_controller.value* 2 * pi, child: child,);
        },
        child: Image(image: AssetImage('assets/images/logo.jpg'),
        ));
  }
}

class googlefacebook extends StatelessWidget {


  late String label;
  late Function() press;
  late Widget child;

  googlefacebook(this.label, this.press, this.child);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: press,
        child: Column(
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: child
            ),
            Text(
             label,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

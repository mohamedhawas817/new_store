import 'package:flutter/material.dart';
import '../widget/authen.dart';


class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _LoginState();
}

class _LoginState extends State<Signup> {


  final _formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 50),
        child: SingleChildScrollView(
          child: Column(

            children: [
              ListTile(
                title: Text("Sign Up", style: TextStyle(fontSize: 28),),
                trailing: Icon(Icons.holiday_village_outlined, color: Colors.black, size: 38, ) ,

                ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius:50,
                      backgroundColor: Colors.purpleAccent,
                    ),
                    SizedBox(width: 80,),
                    Column(
                      children: [
                        iconn(Icon(Icons.camera_alt, color: Colors.white,)),
                        SizedBox(height: 10,),

                        iconn(Icon(Icons.image, color: Colors.white,)),


                      ],
                    )
                  ],
                ),
              ),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                  textformfield(' Full name', 'Enter Full name', false),
                    SizedBox(height: 15,),

                    textformfield('Email address', 'Enter email address', false),

                    SizedBox(height: 15,),

                   textformfield('Password', 'Enter Password', true)


                ],),
              ),
              Row(
                children: [
                  Text("already have an account ?"),
                  TextButton(onPressed: (){}, child: Text("Log In"))
                ],
              )

            ],

          ),
        ),
      )
    );
  }
}


import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widget/authen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;



class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _LoginState();
}

class _LoginState extends State<SignIn> {

  Map<String, String> _authData = {

    'email': '',
    'password' : ''
  };
  final _formkey = GlobalKey<FormState>();
  bool processing = false;
  void submit() async {
    setState(() {
      processing = true;
    });
    if(_formkey.currentState!.validate()) {


        print(_authData["email"]);
        print(_authData["password"]);
        _formkey.currentState!.save();
        try {
          await FirebaseAuth.instance.signInWithEmailAndPassword(email: _authData["email"]!, password: _authData["password"]!);

          Navigator.of(context).pushNamed("customarhome");

        } catch(e) {
          print(e);
          setState(() {
            processing = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
        }
        _formkey.currentState!.reset();

      } else {
      setState(() {
        processing = false;

      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Fill the fields")));
    }


    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Done", textAlign: TextAlign.center,),
          backgroundColor: Colors.lightBlue,
        )
    );
  }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
                child: SingleChildScrollView(
                  child: Column(

                    children: [
                      ListTile(
                        title: Text("Sign In", style: TextStyle(fontSize: 28),),
                        trailing: Icon(Icons.holiday_village_outlined, color: Colors.black, size: 38, ) ,

                      ),

                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [




                            SizedBox(width: 80,),

                          ],
                        ),
                      ),
                      Form(
                        key: _formkey,
                        child: Column(
                          children: [

                            textformfield(
                                _authData['email']!,
                                'Email address',
                                'Enter email address',
                                false,
                                    (value){
                                  _authData['email'] = value;
                                }
                            ),

                            SizedBox(height: 15,),

                            textformfield(
                                _authData['password']!,
                                'Password',
                                'Enter Password',
                                true,
                                    (value){
                                  _authData['password'] = value;
                                }
                            ),

                          ],
                        ),
                      ),

                    ],

                  ),
                ),
              ),
              TextButton(onPressed: (){}, child: Text("Forget the password ?", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),)),

              Padding(
                padding: const EdgeInsets.only(top:20 ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("new User ?"),
                    TextButton(onPressed: (){
                      Navigator.pushReplacementNamed(context, "customar_signup");
                    }, child: Text("Sign Up"))
                  ],
                ),
              ),
              processing == true ? CircularProgressIndicator() : TextButton(
                  onPressed: submit,
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.all(Radius.circular(25))
                    ),
                    child: Center(child: Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 20),)),
                  )
              )

            ],
          ),
        )
    );
  }
}


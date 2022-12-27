import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widget/authen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;



class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _LoginState();
}

class _LoginState extends State<Signup> {

  Map<String, String> _authData = {
    'username': '',
    'email': '',
    'password' : ''
  };
  late String profileImage;
  File? file;
  final _formkey = GlobalKey<FormState>();
  final _scafKey  =   GlobalKey<ScaffoldMessengerState>();
  bool processing = false;
  void submit() async {
    setState(() {
      processing = true;
    });
    if(_formkey.currentState!.validate()) {
      if(file != null) {
        print("image picked");
        print(_authData["email"]);
        print(_authData["password"]);
        _formkey.currentState!.save();
        try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _authData["email"]!, password: _authData["password"]!);
          String image_name = _authData['email']!;
          firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref('cust-images/$image_name.jpg');
          await ref.putFile(File(file!.path));
          profileImage =  await ref.getDownloadURL();
          CollectionReference customars = FirebaseFirestore.instance.collection('customars');
          try {
            await customars.doc(FirebaseAuth.instance.currentUser!.uid).set({
              'name': _authData['username'],
              'email': _authData['email'],
              'profile_image' : profileImage,
              'phone': '',
              'address': '',
              'cid': FirebaseAuth.instance.currentUser!.uid
            });
          }catch(e) {
            print(e);
          }


          Navigator.of(context).pushReplacementNamed("customarhome");

        } catch(e) {
          print(e);
          setState(() {
            processing = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
        }
        _formkey.currentState!.reset();
        setState(() {
          file = null;
        });
      }else {
        setState(() {
          processing = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please pick a image first")));
      }
    }else {
      setState(() {
        processing = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please fill al fields first")));

    }

    _formkey.currentState!.save();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text("Done", textAlign: TextAlign.center,),
          backgroundColor: Colors.lightBlue,
        )
    );
  }

  Future pickimagefromgaller() async {
    final ImagePicker _image = ImagePicker();
    final XFile? pickedImage = await _image.pickImage(source: ImageSource.gallery) as XFile?;
    setState(() {
      file = File(pickedImage!.path);
    });
  }

    Future pickimagefromcameria() async {
    final ImagePicker _image = ImagePicker();
    final XFile? pickedImage = await _image.pickImage(source: ImageSource.camera) as XFile?;
    setState(() {
      file = File(pickedImage!.path);
    });
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
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
                              child: ClipOval(child:file != null ? Image.file(File(file!.path), fit: BoxFit.cover,) : null,),
                              backgroundColor: file != null ? Colors.white:  Colors.purpleAccent,

                              radius: 60,

                            ),

                          SizedBox(width: 80,),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: pickimagefromcameria,
                                  child: iconn(Icon(Icons.camera_alt, color: Colors.white,))
                              ),
                              SizedBox(height: 10,),

                              GestureDetector(
                                  onTap: pickimagefromgaller,
                                  child: iconn(Icon(Icons.image, color: Colors.white,))
                              ),


                            ],
                          )
                        ],
                      ),
                    ),
                    Form(
                      key: _formkey,
                      child: Column(
                        children: [
                        textformfield(
                            _authData['username']!,
                            ' Full name',
                            'Enter Full name',
                            false,
                            (value){
                              _authData['username'] = value;
                            }
                        ),
                          SizedBox(height: 15,),

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
                         )


                      ],),
                    ),

                  ],

                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("already have an account ?"),
                TextButton(onPressed: (){
                  Navigator.pushNamed(context, "customar_signIn");
                }, child: Text("Log In"))
              ],
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
                  child: Center(child: Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 20),)),
                )
            )

          ],
        ),
      )
    );
  }
}


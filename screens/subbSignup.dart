import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widget/authen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;



class SubbliSignup extends StatefulWidget {
  const SubbliSignup({Key? key}) : super(key: key);

  @override
  State<SubbliSignup> createState() => _LoginState();
}

class _LoginState extends State<SubbliSignup> {

  Map<String, String> _authData = {
    'store_name': '',
    'email': '',
    'password' : ''

};
  late String suppImage;
  File? logo_store;
  final _formkey = GlobalKey<FormState>();
  bool processing = false;
  void submit() async {
    setState(() {
      processing = true;
    });
    if(_formkey.currentState!.validate()) {
      if(logo_store != null) {
        print("image picked");
        print(_authData["email"]);
        print(_authData["password"]);
        _formkey.currentState!.save();
        try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _authData["email"]!, password: _authData["password"]!);
          String image_name = _authData['email']!;
          firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref('supp-images/$image_name.jpg');
          await ref.putFile(File(logo_store!.path));
          suppImage =  await ref.getDownloadURL();
          CollectionReference suppler = FirebaseFirestore.instance.collection('suppler');
          try {
            await suppler.doc(FirebaseAuth.instance.currentUser!.uid).set({
              'store_name': _authData['store_name'],
              'email': _authData['email'],
              'store_logo' : suppImage,
              'phone': '',
              'address': '',
              'cid': FirebaseAuth.instance.currentUser!.uid,
              'cover_image': ''
            });
          }catch(e) {
            print(e);
          }


          Navigator.of(context).pushReplacementNamed("supplierhome");

        } catch(e) {
          print(e);
          setState(() {
            processing = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
        }
        _formkey.currentState!.reset();
        setState(() {
          logo_store = null;
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
      logo_store = File(pickedImage!.path);
    });
  }

  Future pickimagefromcameria() async {
    final ImagePicker _image = ImagePicker();
    final XFile? pickedImage = await _image.pickImage(source: ImageSource.camera) as XFile?;
    setState(() {
      logo_store = File(pickedImage!.path);
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
                              child: ClipOval(child:logo_store != null ? Image.file(File(logo_store!.path), fit: BoxFit.cover,) : null,),
                              backgroundColor: logo_store != null ? Colors.white:  Colors.purpleAccent,

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
                                _authData['store_name']!,
                                ' Store name',
                                'Enter Store name',
                                false,
                                    (value){
                                  _authData['store_name'] = value;
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
                    Navigator.pushNamed(context, "supplier_signIn");
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


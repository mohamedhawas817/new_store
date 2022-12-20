import 'dart:io';

import 'package:flutter/material.dart';
import '../widget/authen.dart';
import 'package:image_picker/image_picker.dart';



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
  File? file;
  final _formkey = GlobalKey<FormState>();
  final _scafKey  =   GlobalKey<ScaffoldMessengerState>();

  void submit() {
    if(!_formkey.currentState!.validate()) {
      return;
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
                TextButton(onPressed: (){}, child: Text("Log In"))
              ],
            ),
            TextButton(
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


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class UploadProduct extends StatefulWidget {
  const UploadProduct({Key? key}) : super(key: key);

  @override
  State<UploadProduct> createState() => _UploadProductState();
}

class _UploadProductState extends State<UploadProduct> {


  final formKey = GlobalKey<FormState>();
  ImagePicker _imagepicker = ImagePicker();
   List<XFile?> file = [];

  late  String product_name;
  late String product_desc;
  late int quantity;
  late double price;

  void pickimages() async {
     final images = await _imagepicker.pickMultiImage(
       maxHeight: 300,
       maxWidth: 300,
       imageQuality: 95,
     ) ;
     setState(() {
       file = images ;
     });
     print(file);
  }

  void submit() {
    if(!formKey.currentState!.validate()){
          return;
    }
    else {
      formKey.currentState!.save();
      if(file.isNotEmpty) {
        print("images");
        print(product_name);
        print(product_desc);
        print(quantity);
        print(price);
      }else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please show some images"))
        );

      }

    }


  }



  Widget PreviewImage() {
    if(file.isNotEmpty) {
      return InkWell(
        onLongPress: ()=> setState(() {
          file = [];
        }),
        child: ListView.builder( itemCount: file.length, itemBuilder: (context, index){
          return Image.file(File(file[index]!.path));
        }),
      );
    }else {
      return  const Center(
        child: Text("you have not \n \n picked Images yet", textAlign: TextAlign.center,),
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            onPressed:file.isEmpty ?  () {
              pickimages();
                } :
                    ()=> setState(() {
                  file = [];
                }),
            backgroundColor: Colors.yellow,
            child: file.isEmpty ? Icon(Icons.photo_library, color: Colors.black,) :Icon(Icons.delete_forever, color: Colors.black,) ,),
        ),
        FloatingActionButton(
          onPressed: submit
          , backgroundColor: Colors.yellow,
          child: Icon(Icons.upload, color: Colors.black,),),

      ],) ,
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag ,
          child: Form(
            key: formKey,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Container(
                  color: Colors.blueGrey.shade100,
                  height: MediaQuery.of(context).size.width * 0.5,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: file != null ? PreviewImage()  :  const Center(
                    child: Text("you have not \n \n picked Images yet", textAlign: TextAlign.center,),
                  ),
                )
              ],),
              SizedBox(height: 30, child: Divider(thickness: 1.5, color: Colors.yellow, ), ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Center(
                    child: Center(
                      child: TextFormField(
                        onSaved: (value)=> setState(() {
                          price = double.parse(value!);
                        }),
                        validator: (value) {
                          if(value!.isEmpty) {
                            return "Please enter price";
                          } else if(value.isValidPrice() != true) {
                            return 'not valid price';
                          }
                          return null;
                        },
                        decoration:textFormDecor, keyboardType: TextInputType.numberWithOptions(decimal: true),),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Center(
                    child: Center(
                      child: TextFormField(
                        onSaved: (value)=> setState(() {
                          quantity = int.parse(value!) ;
                        }),
                        validator: (value) {
                          if(value!.isEmpty) {
                            return "Please enter Quantity";
                          }else if (value.isValidQuantity() != true) {
                            return ' not valid quality';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,decoration:textFormDecor.copyWith(hintText: 'Quantity', labelText: 'Qantity')
                        ,
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Center(
                      child: TextFormField(

                        onSaved: (value)=> setState(() {
                          product_name = value!;
                        }),
                        validator: (value) {
                          if(value!.isEmpty) {
                            return "Please enter Product Name";
                          }
                          return null;
                        },
                        maxLength: 100, decoration:textFormDecor.copyWith(hintText: 'Product Name', labelText: 'Product Name')
                        ,
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,

                  child: Center(
                    child: Center(
                      child: TextFormField(
                        onSaved: (value)=> setState(() {
                          product_desc = value!;
                        }),
                        validator: (value) {
                          if(value!.isEmpty) {
                            return "Please the Description";
                          }
                          return null;
                        },
                        maxLength: 800, maxLines: 5 ,decoration:textFormDecor.copyWith(hintText: 'Description', labelText: 'Description')
                        ,
                      ),
                    ),
                  ),
                ),
              ),


            ],
        ),
          ),),
      ),
    );
  }
}


var textFormDecor = InputDecoration(
  labelStyle: TextStyle(color: Colors.purple),
  labelText: 'Price',
  hintText: 'Price ..\$',
  border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10)
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1),
    borderRadius: BorderRadius.circular(10),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.yellow, width: 1),
    borderRadius: BorderRadius.circular(10),
  ),
);


extension QuantityValidator on String {
  bool isValidQuantity() {
    return RegExp(r'^[1-9][0-9]*$').hasMatch(this);
  }
}

extension PriceValidator on String {
  bool isValidPrice() {
    return RegExp(r'^[1-9][0-9]*$').hasMatch(this);
  }
}
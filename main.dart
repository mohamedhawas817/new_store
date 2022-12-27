import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './screens/category.dart';
import './screens/home.dart';
import './screens/profile.dart';
import './screens/shop.dart';
import './screens/shop_cart.dart';
import './screens/stores.dart';
import './screens/customar_home.dart';
import './screens/supplier_home.dart';
import './screens/welcome_screen.dart';
import './screens/dashboard.dart';
import './screens/supplier_home.dart';
import './screens/customar_home.dart';
import './screens/signup.dart';
import './screens/signin.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "homey": (context) => Homy(),
        "category": (context) => Category(),
        "shopping_cart": (context) => Shopping_cart(),
        "profile": (context) => Profile(),
        "Store": (context) => Store(),
        "dashboard": (context) => Dashboard(),
        "supplierhome": (context) => SupplierHome(),
        "customarhome": (context) => HomePage(),
        "welcome_screen" : (context) => WelcomeSCreen(),
        "customar_signup": (context) => Signup(),
        "customar_signIn": (context) => SignIn()


      },
      home:  WelcomeSCreen(),
    );
  }
}


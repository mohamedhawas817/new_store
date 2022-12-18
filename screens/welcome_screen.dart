import 'package:flutter/material.dart';


class WelcomeSCreen extends StatefulWidget {
  const WelcomeSCreen({Key? key}) : super(key: key);

  @override
  State<WelcomeSCreen> createState() => _WelcomeSCreenState();
}

class _WelcomeSCreenState extends State<WelcomeSCreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bgi.jpg')
          )
        ),
      )
    );
  }
}

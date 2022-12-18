import 'package:flutter/material.dart';

class YollowButton extends StatelessWidget {

  late double width;
  late String label;
  Function() press;

  YollowButton(this.width, this.label, this.press);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: MediaQuery.of(context).size.width * width,
      decoration: BoxDecoration(
        color:Colors.yellow,
        borderRadius: BorderRadius.circular(25),

      ),
      child: MaterialButton(
        onPressed: press,
        child: Text(label),
      ),
    );
  }
}
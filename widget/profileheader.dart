import 'package:flutter/material.dart';


class profileHeader extends StatelessWidget {

  String label;
  profileHeader(this.label);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          SizedBox(
            height: 40,
            width: 50,
            child: Divider(color: Colors.grey,thickness: 1,),
          ),
          Text(label, style: TextStyle(color: Colors.grey, fontSize: 24),),
          SizedBox(
            height: 40,
            width: 50,
            child: Divider(color: Colors.grey,thickness: 1,),
          ),
        ],),
    );
  }
}


class devide extends StatelessWidget {
  const devide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Divider(
        color: Colors.yellowAccent,
        thickness: 1,
      ),
    );
  }
}

class listtile extends StatelessWidget {

  String mainone = '';
  String submain = '';
  late Icon icon;
  final Function() press;

  listtile(this.mainone, this.submain, this.icon, this.press);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      title: Text(mainone),
      subtitle: Text(submain),
      leading: icon,
    );
  }
}

class listofpaddin extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 260,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16)
        ),
        child: Column(
          children: [
            listtile('Email Address ', 'examle@mail.com', Icon(Icons.email) , (){}),
            devide(),
            listtile("Phone No", "+111111", Icon(Icons.call), (){}),
            devide(),
            listtile("Address", "140 street - New Jerssy", Icon(Icons.home), (){}),

          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../widget/yallow_button.dart';

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
              fit: BoxFit.cover,
              image: AssetImage('assets/images/bgi.jpg')
            )
          ),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              children: [
                Text(
                    "Welcome",
                  style: TextStyle(
                    color: Colors.white, fontSize: 30
                  ),

                ),
                SizedBox(
                  height: 120,
                  width: 200,
                  child: Image(image: AssetImage('assets/images/logo.jpg'),),
                ),
                Text("SHOP", style: TextStyle(color: Colors.white, fontSize: 30),),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomLeft: Radius.circular(50)
                    )
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Text("Suppliers only", style: TextStyle(color: Colors.yellowAccent, fontSize: 30, fontWeight: FontWeight.w600),),


                  ),
                ),
                SizedBox(height: 6,),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomLeft: Radius.circular(50)
                    ),

                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image(image: AssetImage('assets/images/logo.jpg'),),
                      YollowButton(0.25, 'Log In', (){}),
                      YollowButton(0.35, 'Sign Up', (){}),
                    ],
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50)
                      ),

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        YollowButton(0.25, 'Log In', (){}),
                        YollowButton(0.35, 'Sign Up', (){}),
                        Image(image: AssetImage('assets/images/logo.jpg'),),
                      ],
                    ),
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white38
                  ),
                  child: Row(
                    children: [
                      googlefacebook()
                    ],
                  ),
                )



              ],
            ),
          ),
        ),

    );
  }
}

class googlefacebook extends StatelessWidget {
  const googlefacebook({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: (){},
        child: Column(
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: Image(
                image: AssetImage('assets/images/google.jpg'),
              ),
            ),
            Text(
              "Google",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

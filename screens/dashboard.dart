import 'package:flutter/material.dart';




List<String> label = [
  'my store',
  'orders',
  'edit profile',
  'manage products',
  'balance',
  'static'
];

List<IconData> icons = [
  Icons.store,
  Icons.shop_2_outlined,
  Icons.edit,
  Icons.settings,
  Icons.attach_money,
  Icons.show_chart
];


class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Dashboard", style: TextStyle(color: Colors.black),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.logout, color: Colors.black,))
        ],
      ),
      body: GridView.count(
        mainAxisSpacing: 50,
          crossAxisSpacing: 50,
          crossAxisCount: 2, children: List.generate(6, (index) {
            return Card(
              elevation: 20,
              shadowColor: Colors.purpleAccent.shade200,
              color: Colors.blueGrey.withOpacity(0.7),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(icons[index],
                    color: Colors.yellowAccent,
                    size: 50,
                  ),
                  Text(label[index].toUpperCase(), style: TextStyle(
                      fontSize: 16,
                    color: Colors.yellowAccent,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                    fontFamily: 'Acme'
                  ),
                  )
                ],
              ),
            );
      })
      ),
    );
  }
}

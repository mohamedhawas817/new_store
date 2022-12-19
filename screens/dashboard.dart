import 'package:flutter/material.dart';
import '../dashboard_componets/edit_bussins.dart';
import '../dashboard_componets/manage_products.dart';
import '../dashboard_componets/my_store.dart';
import '../dashboard_componets/supp_balances.dart';
import '../dashboard_componets/supp_orders.dart';
import '../dashboard_componets/supp_statics.dart';





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


List<Widget> screens = [
  My_store(),
  Supp_orders(),
  EditBus(),
  Manage_products(),
  Supp_balance(),
  Supp_statics()
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
            return InkWell(
              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> screens[index])) ,
              child: Card(
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
              ),
            );
      })
      ),
    );
  }
}

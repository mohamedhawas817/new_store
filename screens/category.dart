import 'package:flutter/material.dart';
import './home.dart';
import '../widget/fake_search.dart';
import '.././categories/category_men.dart';

List<ItemData> items = [
  ItemData(label: 'men'),
  ItemData(label: 'women', ),
  ItemData(label: 'electro', ),
  ItemData(label: 'accesso', ),
  ItemData(label: 'shoes', ),
  ItemData(label: 'home', ),
  ItemData(label: 'kids', ),
  ItemData(label: 'beauty', ),




];


class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {

  PageController _pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    for (var i in items) {
      i.isSelected = false;
    }
    setState(() {
      items[0].isSelected = true;
    });
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.white,
      title: Fakesearch(),

    ),
      body: Stack(children: [
        Positioned(
          bottom: 0,
            left: 0,
            child: SizedBox(
              child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width * 0.2,
          color: Colors.grey.shade300,
                child: ListView.builder(

                  itemCount: items.length,
                    itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {

                      _pageController.jumpToPage(index);

                      // for (var i in items){
                      //   i.isSelected = false;
                      // }
                      // setState(() {
                      //
                      //   items[index].isSelected = true;
                      //
                      // });
                    },
                    child: Container(
                      color: items[index].isSelected ? Colors.white :Colors.grey.shade300,
                        height: 100,
                        child: Center(child: Text(items[index].label))

                    ),
                  );
                }) ,
        ),
            )),
        Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.8,
              color: Colors.white,
              child: PageView(
                controller: _pageController,
                onPageChanged: (val){
                  for (var i in items) {
                    i.isSelected = false;
                  }
                  setState(() {
                    items[val].isSelected = true;
                  });

                },
                scrollDirection: Axis.vertical,
                children: [
                  Category_men(),
                Center(child: Text("women category"),),
                Center(child: Text("electro category"),),
                Center(child: Text("accesso category"),),
                Center(child: Text("shoes category"),),
                Center(child: Text("home category"),),
                Center(child: Text("kids category"),),
                Center(child: Text("beauty category"),),
              ],),
            ))
      ],),
    );
  }

}

class ItemData {
  String label;
  bool isSelected;
  ItemData({required this.label, this.isSelected = false});
}

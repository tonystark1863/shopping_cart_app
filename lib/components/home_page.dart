import 'package:flutter/material.dart';
import 'package:shopping_app/components/cart/cart.dart';
import 'package:shopping_app/components/productpage/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentPage = 0;

  List<Widget> pages =const [ ProductList(), Cart()];

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: IndexedStack(
        index: currentPage ,
        children: pages,
      ) ,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value){
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        elevation: 10,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        items:const [
          BottomNavigationBarItem(
      
            label: "",
            icon: Icon(Icons.home)
            ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.shopping_cart)
            ),
      
        ],
      ),
    );
    

  }
}
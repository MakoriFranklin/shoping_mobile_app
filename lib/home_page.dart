import "package:flutter/material.dart";
import "package:shop_flutter_app/cart_page.dart";
import "package:shop_flutter_app/product_list.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
int currentPage = 0;
List<Widget> pages = [
  const ProductList(),
  const CartPage()
];
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        iconSize: 30,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ''
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: ''
          ),
        ],
      ),
    );

  }
}
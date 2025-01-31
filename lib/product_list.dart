import 'package:flutter/material.dart';
import "package:shop_flutter_app/global_variables.dart";
import "package:shop_flutter_app/product_card.dart";
import "package:shop_flutter_app/product_details_page.dart";

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const ["All", "addidas", "Nike", "Bata"];
  late String selectedFilter;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(225, 225, 225, 1),
                        ),
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(50)
                        ),
                      );
    return SafeArea(
        child: Column(
          children: [
           Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Shoes\n collections",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),

              const  Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search a shoe",
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 120,
              
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onDoubleTap: () {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                      child: Chip(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10 ),
                        label: Text(filter),
                        backgroundColor: selectedFilter == filter ? Theme.of(context).colorScheme.primary : const Color.fromRGBO(245, 247, 249, 1),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  );
                },
              ),
            ),
            
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index){
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context){
                            return ProductDetailsPage(product: product);
                          }
                      ),
                    );
                    },
                    child: ProductCard(
                      title: product['title'] as String,
                      price: product['price'] as double,
                      image: product['imageUrl'] as String,
                      backgroundColor: index.isEven ? const Color.fromRGBO(216, 240, 253, 1) : const Color.fromRGBO(245, 247, 249, 1),
                    ),
                  );
                }
                ),
            ),
          ],
        
        ),
      );
  }
}
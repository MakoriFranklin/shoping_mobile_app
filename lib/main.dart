import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_flutter_app/cart_provider.dart';
import 'package:shop_flutter_app/home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Roboto',
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(254, 206, 1, 1),
          primary: const Color.fromRGBO(254, 206, 1, 1)
          
          ),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15
            ),
            prefixIconColor: Color.fromRGBO(119, 119, 119, 1)
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
      
            bodySmall: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),
          ),
      
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 20,
              color: Colors.black
            ),
          ),
          useMaterial3: true
        ),
        debugShowCheckedModeBanner: false,
        title: "Shopping App",
        home: const HomePage()
      ),
    );
  }
}
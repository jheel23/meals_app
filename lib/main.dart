import 'package:flutter/material.dart';
import '/./meals_page.dart';
import './categories_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromARGB(255, 243, 242, 202),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: TextStyle(color: Color.fromRGBO(21, 51, 51, 1)),
              bodyMedium: TextStyle(color: Color.fromRGBO(21, 51, 51, 1)),
              titleMedium: TextStyle(fontSize: 20, fontFamily: 'Robot'),
            ),
      ),
      home: CategoriesPage(),
      routes: {'/meals-page': (ctx) => MealsPage()},
    );
  }
}

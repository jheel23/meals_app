import './models/dummy_data.dart';
import './models/meal.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/pages/filters_page.dart';
import 'package:meals_app/pages/meals_detail_page.dart';
import 'pages/meals_page.dart';
import 'pages/categories_page.dart';
import 'pages/tab_pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /*We are doing this👇in main.dart file this is the only palce where we have category and filter pages both in ROUTE SECTION*/
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'veg': false,
    'nonveg': false,
  };
  List<Meal> _availableMeal =
      DUMMY_MEALS; //Initially to show all meals without filter
  List<Meal> _favouriteMeal = [];
  void _applyFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeal = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['veg']! && !meal.isV) {
          return false;
        }
        if (_filters['nonveg']! && !meal.isNV) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavourite(String mealId) {
    final existingIndex =
        _favouriteMeal.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favouriteMeal.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavourite(String id) {
    return _favouriteMeal.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromARGB(255, 243, 242, 202),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: TextStyle(color: Color.fromRGBO(21, 51, 51, 1)),
              bodyMedium: TextStyle(color: Color.fromRGBO(21, 51, 51, 1)),
              titleSmall: TextStyle(fontSize: 20, fontFamily: 'Raleway'),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsPage(_favouriteMeal),
        MealsPage.routeName: (ctx) => MealsPage(_availableMeal),
        MealsDetailPage.routeName: (ctx) =>
            MealsDetailPage(_toggleFavourite, _isMealFavourite),
        FiltersPage.routeName: (ctx) => FiltersPage(_filters, _applyFilters),
      },
      //onGenerateRoute: , /*it can be used as an feature
      //it takes setting argument and in that setting we have all info of route like name,
      //arguments then later we can use this to load specific routes using conditional statemensts*/

      onUnknownRoute: (settings) {
        //run When nothing available to show on Screen not even onGenerateRoute
        return MaterialPageRoute(
          builder: (ctx) => CategoriesPage(),
        );
      },
    );
  }
}

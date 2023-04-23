import 'package:flutter/material.dart';
import 'package:meals_app/pages/categories_page.dart';
import 'package:meals_app/pages/favourite_page.dart';
import '../widgets/main_drawer.dart';
import '../models/meal.dart';

class TabsPage extends StatefulWidget {
  final List<Meal> favouriteMeal;
  TabsPage(this.favouriteMeal);

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  /*NOTE: We cant use "widget" keyword in STATE we can use it in build and initstate */
  late List<Map<String, dynamic>> _pages;
  @override
  void initState() {
    _pages = [
      {'page': CategoriesPage(), 'title': 'Categories'},
      {'page': FavouritePage(widget.favouriteMeal), 'title': 'Favorites'}
    ];
    super.initState();
  }

  int _pageIndex = 0;
  void _selectedPage(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_pageIndex]['title'],
          style: TextStyle(fontFamily: 'Raleway', fontSize: 30),
        ),
      ),
      drawer: MainDrawer(),
      body: _pages[_pageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: _pageIndex,
        //type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite')
        ],
      ),
    );

    //BELOW: Methods work on Top TabBar For bottom TabBar Follow Above method
    /*DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Meals',
              style:
                  TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.bold),
            ),
            bottom: TabBar(tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: 'Favourites',
              ),
            ]),
          ),
          body: TabBarView(children: [CategoriesPage(), FavouritePage()]),
        ));*/
  }
}

import 'package:flutter/material.dart';
import 'package:meals_app/pages/filters_page.dart';

class MainDrawer extends StatelessWidget {
  Widget Listtile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'Robot', fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onTap: () => tapHandler(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          color: Colors.amber,
          alignment: Alignment.center,
          height: 120,
          width: double.infinity,
          child: Text(
            'What\'s Up Nigga!',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 26,
                fontFamily: 'Robot',
                fontWeight: FontWeight.w900),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Listtile('Meals', Icons.restaurant, () {
          Navigator.of(context).pushReplacementNamed('/');
        }),
        Listtile('Filters', Icons.settings, () {
          Navigator.of(context).pushReplacementNamed(FiltersPage.routeName);
        }),
      ]),
    );
  }
}

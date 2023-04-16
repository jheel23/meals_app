import 'package:flutter/material.dart';

class MealsPage extends StatelessWidget {
  // final String title;
  // final String id;
  // MealsPage(this.id, this.title);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final title = routeArgs['title'];
    final id = routeArgs['id'];

    return Scaffold(
      appBar: AppBar(
        title: Text(title as String),
      ),
      body: Center(
        child: Text(id as String),
      ),
    );
  }
}

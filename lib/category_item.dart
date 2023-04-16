import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  const CategoryItem(this.id, this.title, this.color);
  void changeToMealsPage(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed('/meals-page', arguments: {'id': id, 'title': title}
            // MaterialPageRoute(builder: (_) {
            //   return MealsPage(this.id, this.title);
            // }),
            );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      onTap: () => changeToMealsPage(context),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.8), color.withOpacity(0.8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}

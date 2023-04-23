import 'package:flutter/material.dart';
import '../../models/dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10),
      itemBuilder: (context, index) {
        return CategoryItem(DUMMY_CATEGORIES[index].id,
            DUMMY_CATEGORIES[index].title, DUMMY_CATEGORIES[index].color);
      },
      itemCount: DUMMY_CATEGORIES.length,
    );
  }
}

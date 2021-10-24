import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesRoute extends StatelessWidget {
  const CategoriesRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: dummyCategories.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      padding: const EdgeInsets.all(25),
      itemBuilder: (_, index) {
        final category = dummyCategories[index];
        final id = category.id;
        final title = category.title;
        final color = category.color;

        return CategoryItem(
          id: id,
          title: title,
          color: color,
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

import '../models/meal.dart';
import 'meal_item.dart';

class MealsList extends StatelessWidget {
  final List<Meal> meals;

  const MealsList({
    Key? key,
    required this.meals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: meals.length,
        itemBuilder: (_, index) {
          final meal = meals.elementAt(index);

          return MealItem(
            meal: meal,
          );
        },
      );
}

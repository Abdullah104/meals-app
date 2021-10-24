import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meals_list.dart';

class FavoritesRoute extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoritesRoute({
    Key? key,
    required this.favoriteMeals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => favoriteMeals.isEmpty
      ? const Center(
          child: Text('You have no favorites yet - start adding some!'),
        )
      : MealsList(
          meals: favoriteMeals,
        );
}

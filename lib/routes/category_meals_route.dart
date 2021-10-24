import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meals_list.dart';

class CategoryMealsRoute extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;

  const CategoryMealsRoute({
    Key? key,
    required this.availableMeals,
  }) : super(key: key);

  @override
  State<CategoryMealsRoute> createState() => _CategoryMealsRouteState();
}

class _CategoryMealsRouteState extends State<CategoryMealsRoute> {
  late String categoryTitle;
  late List<Meal> displayedMeals;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final routeArguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final categoryId = routeArguments['id']!;
    categoryTitle = routeArguments['title']!;

    displayedMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final categoryTitle = routeArguments['title']!;

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: MealsList(
        meals: displayedMeals,
      ),
    );
  }
}

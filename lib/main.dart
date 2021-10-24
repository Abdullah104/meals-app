import 'package:flutter/material.dart';

import 'dummy_data.dart';
import 'models/meal.dart';
import 'routes/category_meals_route.dart';
import 'routes/filters_route.dart';
import 'routes/meal_details.dart';
import 'routes/tabs_route.dart';

void main() => runApp(const MealsApp());

class MealsApp extends StatefulWidget {
  const MealsApp({Key? key}) : super(key: key);

  @override
  State<MealsApp> createState() => _MealsAppState();
}

class _MealsAppState extends State<MealsApp> {
  var filters = {
    'vegan': false,
    'vegetarian': false,
    'lactose-free': false,
    'gluten-free': false,
  };
  var availableMeals = dummyMeals;
  final favoriteMeals = <Meal>[];

  final theme = ThemeData(
    primarySwatch: Colors.pink,
    canvasColor: const Color.fromRGBO(255, 254, 229, 1),
    fontFamily: 'Raleway',
    textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: const TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          bodyText2: const TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          headline6: const TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          secondary: Colors.amber,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (_) => TabsRoute(
              favoriteMeals: favoriteMeals,
            ),
        CategoryMealsRoute.routeName: (_) => CategoryMealsRoute(
              availableMeals: availableMeals,
            ),
        MealDetails.routeName: (_) => MealDetails(
              toggleFavorite: toggleFavorite,
              isMealFavorite: isMealFavorite,
            ),
        FiltersRoute.routeName: (_) => FiltersRoute(
              filters: filters,
              setFilters: setFilters,
            ),
      },
    );
  }

  void setFilters(Map<String, bool> filters) => setState(() {
        this.filters = filters;

        availableMeals = dummyMeals.where((meal) {
          meal.isVegan == filters['vegan'] &&
              meal.isVegetarian == filters['vegetarian'] &&
              meal.isLactoseFree == filters['lactose-free'] &&
              meal.isGlutenFree == filters['gluten-free'];

          return !((filters['vegan']! && !meal.isVegan) ||
              (filters['vegetarian']! && !meal.isVegetarian) ||
              (filters['lactose-free']! && !meal.isLactoseFree) ||
              (filters['gluten-free']! && !meal.isGlutenFree));
        }).toList();
      });

  void toggleFavorite(String mealId) => setState(() => favoriteMeals
          .any((meal) => meal.id == mealId)
      ? favoriteMeals.removeWhere((meal) => meal.id == mealId)
      : favoriteMeals.add(dummyMeals.firstWhere((meal) => meal.id == mealId)));

  bool isMealFavorite(String mealId) =>
      favoriteMeals.any((meal) => meal.id == mealId);
}

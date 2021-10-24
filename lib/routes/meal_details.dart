import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/ingredient.dart';
import '../widgets/meal_step.dart';
import '../widgets/section.dart';
import '../widgets/section_title.dart';

class MealDetails extends StatelessWidget {
  static const routeName = '/meal-details';
  final void Function(String) toggleFavorite;
  final bool Function(String) isMealFavorite;

  const MealDetails({
    Key? key,
    required this.toggleFavorite,
    required this.isMealFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Hero(
                tag: meal.imageUrl,
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SectionTitle(
              text: 'Ingredients',
            ),
            Section(
              child: ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (_, index) => Ingredient(
                  ingredient: meal.ingredients[index],
                ),
              ),
            ),
            const SectionTitle(text: 'Steps'),
            Section(
              child: ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (_, index) => MealStep(
                  index: index,
                  step: meal.steps[index],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isMealFavorite(meal.id) ? Icons.star : Icons.star_border),
        onPressed: () => toggleFavorite(meal.id),
      ),
    );
  }
}

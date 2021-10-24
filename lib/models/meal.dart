enum Affordability { affordable, pricey, luxurious }

enum Complexity { simple, challenging, hard }

class Meal {
  final String id;
  final String title;
  final List<String> categories;
  final Affordability affordability;
  final Complexity complexity;
  final String imageUrl;
  final int duration;
  final List<String> ingredients;
  final List<String> steps;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;

  const Meal({
    required this.id,
    required this.title,
    required this.categories,
    required this.affordability,
    required this.complexity,
    required this.imageUrl,
    required this.duration,
    required this.ingredients,
    required this.steps,
    required this.isGlutenFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.isLactoseFree,
  });

  String get complexityText {
    String text;

    switch (complexity) {
      case Complexity.simple:
        text = 'Simple';
        break;

      case Complexity.challenging:
        text = 'Challenging';
        break;

      case Complexity.hard:
        text = 'Hard';
        break;
    }

    return text;
  }

  String get affordabilityText {
    String text;

    switch (affordability) {
      case Affordability.affordable:
        text = 'Affordable';
        break;

      case Affordability.pricey:
        text = 'Pricey';
        break;

      case Affordability.luxurious:
        text = 'Luxurious';
        break;
    }

    return text;
  }
}

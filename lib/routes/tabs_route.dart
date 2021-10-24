import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import 'categories_route.dart';
import 'favorites_route.dart';

class TabsRoute extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsRoute({
    Key? key,
    required this.favoriteMeals,
  }) : super(key: key);

  @override
  _TabsRouteState createState() => _TabsRouteState();
}

class _TabsRouteState extends State<TabsRoute> {
  late final routes = [
    {
      'route': const CategoriesRoute(),
      'title': 'Categories',
      'icon': const Icon(Icons.category),
    },
    {
      'route': FavoritesRoute(
        favoriteMeals: widget.favoriteMeals,
      ),
      'title': 'Favorites',
      'icon': const Icon(Icons.favorite),
    },
  ];
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(routes[_selectedTab]['title'] as String),
      ),
      drawer: const MainDrawer(),
      body: routes[_selectedTab]['route'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          currentIndex: _selectedTab,
          type: BottomNavigationBarType.shifting,
          onTap: _selectRoute,
          items: routes
              .map(
                (route) => BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor,
                  icon: route['icon'] as Icon,
                  label: route['title'] as String,
                ),
              )
              .toList()),
    );
  }

  void _selectRoute(int index) => setState(() => _selectedTab = index);
}

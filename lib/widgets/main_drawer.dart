import 'package:flutter/material.dart';
import 'package:meals_app/routes/filters_route.dart';

import 'drawer_list_tile.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          DrawerListTile(
            icon: Icons.restaurant,
            text: 'Meals',
            onTap: () => Navigator.pushReplacementNamed(context, '/'),
          ),
          DrawerListTile(
            icon: Icons.settings,
            text: 'Filters',
            onTap: () =>
                Navigator.pushReplacementNamed(context, FiltersRoute.routeName),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../widgets/filter.dart';
import '../widgets/main_drawer.dart';

class FiltersRoute extends StatefulWidget {
  static const routeName = '/filters';
  final Map<String, bool> filters;

  final void Function(Map<String, bool>) setFilters;

  const FiltersRoute({
    Key? key,
    required this.setFilters,
    required this.filters,
  }) : super(key: key);

  @override
  State<FiltersRoute> createState() => _FiltersRouteState();
}

class _FiltersRouteState extends State<FiltersRoute> {
  late bool _vegan;
  late bool _vegetarian;
  late bool _lactoseFree;
  late bool _glutenFree;

  @override
  void initState() {
    super.initState();

    _vegan = widget.filters['vegan']!;
    _vegetarian = widget.filters['vegetarian']!;
    _lactoseFree = widget.filters['lactose-free']!;
    _glutenFree = widget.filters['gluten-free']!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: const Text('Your Filters'),
        actions: [
          IconButton(
            onPressed: () {
              final filters = <String, bool>{
                'vegan': _vegan,
                'vegetarian': _vegetarian,
                'lactose-free': _lactoseFree,
                'gluten-free': _glutenFree,
              };

              widget.setFilters(filters);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Filter(
                  value: _vegan,
                  toggleHandler: (newValue) =>
                      setState(() => _vegan = newValue),
                  title: 'Vegan',
                  subtitle: 'Only include vegan meals.',
                ),
                Filter(
                  value: _vegetarian,
                  toggleHandler: (newValue) =>
                      setState(() => _vegetarian = newValue),
                  title: 'Vegetarian',
                  subtitle: 'Only include vegetarian meals.',
                ),
                Filter(
                  value: _lactoseFree,
                  toggleHandler: (newValue) =>
                      setState(() => _lactoseFree = newValue),
                  title: 'Lactose-Free',
                  subtitle: 'Only include lactose-free meals.',
                ),
                Filter(
                  value: _glutenFree,
                  toggleHandler: (newValue) =>
                      setState(() => _glutenFree = newValue),
                  title: 'Gluten-Free',
                  subtitle: 'Only include gluten-free meals.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

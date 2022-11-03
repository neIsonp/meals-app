import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/favourite_screen.dart';

import '../models/meal.dart';

class TabsScrenn extends StatefulWidget {
  final List<Meal> favouriteMeals;

  const TabsScrenn({super.key, required this.favouriteMeals});

  @override
  State<TabsScrenn> createState() => _TabsScrennState();
}

class _TabsScrennState extends State<TabsScrenn> {
  int _selectecScreenIndex = 0;

  late List<Map<String, Object>> _screens;

  @override
  void initState() {
    super.initState();

    _screens = [
      {
        'title': 'Lista de Categorias',
        'screen': CategoriesScreen(),
      },
      {
        'title': 'Meu Favoritos',
        'screen': FavouriteScreen(
          favouriteMeals: widget.favouriteMeals,
        )
      }
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectecScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_screens[_selectecScreenIndex]['title'] as String),
          centerTitle: true,
        ),
        drawer: MainDrawer(),
        body: _screens[_selectecScreenIndex]['screen'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectScreen,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          currentIndex: _selectecScreenIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Categorias",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "Favoritos",
            ),
          ],
        ),
      ),
    );
  }
}

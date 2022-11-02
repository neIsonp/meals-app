import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/favourite_screen.dart';

class TabsScrenn extends StatefulWidget {
  const TabsScrenn({super.key});

  @override
  State<TabsScrenn> createState() => _TabsScrennState();
}

class _TabsScrennState extends State<TabsScrenn> {
  int _selectecScreenIndex = 0;

  final List<Map<String, Object>> _screens = [
    {'title': 'Lista de Categorias', 'screen': CategoriesScreen()},
    {'title': 'Meu Favoritos', 'screen': FavouriteScreen()}
  ];

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

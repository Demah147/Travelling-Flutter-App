import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../widgets/app_drawer.dart';
import './categories_screen.dart';
import './favorit_screen.dart';
import 'package:flutter/src/material/bottom_navigation_bar.dart';

class TabsScreen extends StatefulWidget {
  final List<Trip> favoritTrips;
  TabsScreen(this.favoritTrips);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  int _selectedScreenIndex = 0;

  late List<Map<String, dynamic>> _screens;

  @override
  void initState() {
    _screens = [
      {
        'Screen': const CategoriesScreen(),
        'Title': 'تصنيفات الرحلات',
      },
      {
        'Screen': FavoritScreen(widget.favoritTrips),
        'Title': 'الرحلات المفضلة',
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]['Title']),
      ),
      drawer: AppDrawer(),
      body: _screens[_selectedScreenIndex]['Screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).secondaryHeaderColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedScreenIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: 'التصنيفات'),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'المفضلة',
          ),
        ],
      ),
    );
  }
}

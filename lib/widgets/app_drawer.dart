import 'package:flutter/material.dart';
import '../Screens/filters_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  Widget buildListTile(String title, IconData icon, Function onTapLink) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: Colors.deepPurple,
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: 'Amiri', fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onTap: () {
//....
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Colors.deepPurple,
            child: Text(
              'دليلك السياحي',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          SizedBox(height: 20),
          buildListTile(
            'الرحلات',
            Icons.card_travel,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListTile(
            'اختر التصفية',
            Icons.filter_list,
            () {
              Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.screenRoute);
            },
          ),
        ],
      ),
    );
  }
}

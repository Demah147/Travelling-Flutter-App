import 'package:flutter/material.dart';
import 'package:travelinnng_app/Screens/categories_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:travelinnng_app/Screens/category_trips.dart';
import './Screens/trip_detail_screen.dart';

void main() {
  runApp(const TravelingApp());
}

class TravelingApp extends StatelessWidget {
  const TravelingApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'AE'), // English
      ],
      title: 'Travel App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        hintColor: Colors.amber,
        fontFamily: 'Amiri',
        textTheme: ThemeData.light().textTheme.copyWith(
              headlineMedium: const TextStyle(
                color: Colors.blue,
                fontSize: 24,
                fontFamily: 'Amiri',
                fontWeight: FontWeight.bold,
              ),
              headlineLarge: const TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontFamily: 'Amiri',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (CTX) => CategoriesScreen(),
        CategoryTripsScreen.screenRoute: (ctx) => CategoryTripsScreen(),
        TripDetailScreen.screenRoute: (ctx) => TripDetailScreen(),
      },
    );
  }
}

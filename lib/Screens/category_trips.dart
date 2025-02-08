import 'package:flutter/material.dart';
import 'package:travelinnng_app/models/trip.dart';
import 'package:travelinnng_app/widgets/trip_item.dart';

import '../app_data.dart';

class CategoryTripsScreen extends StatelessWidget {
  static const screenRoute = '/category-trips';

  const CategoryTripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArqument =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routeArqument['id'];
    final categoryTitle = routeArqument['title'];

    final filteredTrips = Trips_data.where((trip) {
      return trip.categ.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return TripItem(
            id: filteredTrips[index].id,
            title: filteredTrips[index].title,
            imageUrl: filteredTrips[index].imageUrl,
            duration: filteredTrips[index].duration,
            tripType: '',
            season: filteredTrips[index].season,
          );
        },
        itemCount: filteredTrips.length,
      ),
    );
  }
}

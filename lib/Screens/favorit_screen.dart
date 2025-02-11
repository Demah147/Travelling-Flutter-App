import 'package:flutter/material.dart';
import 'package:travelinnng_app/widgets/trip_item.dart';
import '../models/trip.dart';

class FavoritScreen extends StatelessWidget {
  final List<Trip> favoritTrps;
  FavoritScreen(this.favoritTrps);

  get displayTrips => null;
  @override
  Widget build(BuildContext context) {
    if (favoritTrps.isEmpty) {
      return Center(
        child: Text('ليس لديك اي رحلة في قائمة المفضلة'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return TripItem(
            title: favoritTrps[index].title,
            imageUrl: favoritTrps[index].imageUrl,
            duration: int.parse(favoritTrps[index].duration),
            tripType: favoritTrps[index].tripType.name,
            season: favoritTrps[index].season,
            id: favoritTrps[index].id,
            // removeItem: _removeTrip,
          );
        },
        itemCount: favoritTrps.length,
      );
    }
  }
}

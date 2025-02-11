import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../widgets/trip_item.dart';

class CategoryTripsScreen extends StatefulWidget {
  static const screenRoute = '/category-trips';
  final List<Trip> availableTrips;

  CategoryTripsScreen(this.availableTrips);

  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  late String categoryTitle;
  late List<Trip> displayTrips;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArqument =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final categoryId = routeArqument['id'];
    categoryTitle = routeArqument['title'];

    displayTrips = widget.availableTrips.where((trip) {
      return trip.categ.contains(categoryId);
    }).toList();

    super.didChangeDependencies();
  }

  void _removeTrip(String tripId) {
    setState(() {
      displayTrips.removeWhere((trip) => trip.id == tripId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return TripItem(
            title: displayTrips[index].title,
            imageUrl: displayTrips[index].imageUrl,
            duration: int.parse(displayTrips[index].duration),
            tripType: displayTrips[index].tripType.name,
            season: displayTrips[index].season,
            id: displayTrips[index].id,
            //    removeItem: _removeTrip,
          );
        },
        itemCount: displayTrips.length,
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('categoryTitle', categoryTitle));
  }
}

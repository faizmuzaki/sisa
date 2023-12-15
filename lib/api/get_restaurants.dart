import 'package:dio/dio.dart';
import '../models/restaurants_model.dart';
import 'package:geolocator/geolocator.dart';

enum SortCriteria { lowestPrice, highestPrice, nearest }

class GetRestaurant {
  Future<List<Restaurant>> getRestaurantsSortedBy(
      {SortCriteria? sortBy, Position? currentPosition}) async {
    var dio = Dio();
    Response response;

    response = await dio.get(
        "https://restapimobile-default-rtdb.firebaseio.com/restaurants.json");

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = response.data;

      final List<Restaurant> restaurants = [];

      if (jsonData.isNotEmpty) {
        jsonData.forEach((key, value) {
          restaurants.add(Restaurant.fromJson(value));
        });

        if (sortBy == SortCriteria.lowestPrice) {
          restaurants.sort((a, b) => a.lowestPrice.compareTo(b.lowestPrice));
        } else if (sortBy == SortCriteria.highestPrice) {
          restaurants.sort((a, b) => b.highestPrice.compareTo(a.highestPrice));
        } else if (sortBy == SortCriteria.nearest && currentPosition != null) {
          restaurants.sort((a, b) {
            double distanceA = _calculateDistance(a.coordinates,
                currentPosition.latitude, currentPosition.longitude);
            double distanceB = _calculateDistance(b.coordinates,
                currentPosition.latitude, currentPosition.longitude);
            return distanceA.compareTo(distanceB);
          });
        }

        return restaurants;
      }
    }

    return [];
  }

  double _calculateDistance(String coordinates, double lat, double lon) {
    List<String> coordinateList = coordinates.split(',');
    double latitude = double.parse(coordinateList[0]);
    double longitude = double.parse(coordinateList[1]);
    return Geolocator.distanceBetween(lat, lon, latitude, longitude);
  }
}

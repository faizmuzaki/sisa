import 'package:dio/dio.dart';
import '../models/restaurants_model.dart';

class GetRestaurant {
  Future<Map<String, Restaurant>> getRestaurants() async {
    var dio = Dio();
    Response response;

    response = await dio.get(
        "https://restapimobile-default-rtdb.firebaseio.com/restaurants.json");

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = response.data;

      final Map<String, Restaurant> restaurants = {};

      if (json.isNotEmpty) {
        json.forEach((key, value) {
          restaurants[key] = Restaurant.fromJson(value);
        });
        return restaurants;
      }
    }

    return {};
  }
}

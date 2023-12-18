import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sisa/api/get_restaurants.dart';
import 'package:sisa/models/restaurants_model.dart';

class CheapestRestaurant extends StatefulWidget {
  const CheapestRestaurant({Key? key}) : super(key: key);

  @override
  State<CheapestRestaurant> createState() => _CheapestRestaurantState();
}

class _CheapestRestaurantState extends State<CheapestRestaurant> {
  var _value = 1;
  var restaurantServices = GetRestaurant();
  Position? _currentPosition;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    setState(() {
      _currentPosition = null;
    });

    _currentPosition = await Geolocator.getCurrentPosition();
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  double _calculateDistance(
      double lat1, double lon1, double lat2, double lon2) {
    return Geolocator.distanceBetween(lat1, lon1, lat2, lon2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Restaurants")),
      body: SafeArea(
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : FutureBuilder<List<Restaurant>>(
                future: restaurantServices.getRestaurantsSortedBy(
                    sortBy: SortCriteria.lowestPrice),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Restaurant>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    final List<Restaurant> restaurants = snapshot.data ?? [];
                    return ListView.builder(
                      itemCount: restaurants.length,
                      itemBuilder: (context, index) {
                        final restaurant = restaurants[index];
                        String coordinates = restaurant.coordinates;
                        List<String> coordinateList = coordinates.split(',');
                        double latitude = double.parse(coordinateList[0]);
                        double longitude = double.parse(coordinateList[1]);
                        double latitudeg = double.parse('-5.36435');
                        double longitudeg = double.parse('105.24316');
                        double distance = _currentPosition != null
                            ? _calculateDistance(
                                latitude, longitude,
                                // latitudeg, longitudeg
                                _currentPosition!.latitude,
                                _currentPosition!.longitude,
                              )
                            : 0.0;

                        String distanceText = distance >= 1000
                            ? '${(distance / 1000).toStringAsFixed(2)} KM'
                            : '${distance.toInt()} M';
                        return Row(
                          children: [
                            Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.network(
                                            restaurant.image,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          left: 0,
                                          right: 0,
                                          child: Container(
                                            height: 35,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(8),
                                                bottomRight: Radius.circular(8),
                                              ),
                                              color: Color(0xFFFB9701),
                                            ),
                                            child: Center(
                                              child: Text(
                                                '${restaurant.discount.toString()}% OFF',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 55,
                                          left: 23,
                                          child: Container(
                                            width: 55,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                            ),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color: Color.fromARGB(
                                                        255, 255, 213, 0),
                                                    size: 14,
                                                  ),
                                                  SizedBox(width: 4),
                                                  Text(
                                                    '${restaurant.rate.toString()}',
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                height: 100,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      restaurant.placeName,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      restaurant.type,
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      'Bandar Lampung / ${distanceText}\nHarga: ${restaurant.lowestPrice} - ${restaurant.highestPrice}',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
      ),
    );
  }
}

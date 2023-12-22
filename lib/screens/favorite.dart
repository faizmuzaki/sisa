import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  final List<RestaurantData> restaurants = [
    RestaurantData('RM. AlamKuning', 'Bandar Lampung', 1.0, 'rm1.png'),
    RestaurantData('RM. Rumah Kayu', 'Bandar Lampung', 1.5, 'rm2.png'),
    RestaurantData('Begadang', 'Bandar Lampung', 3.2, 'rm3.png'),
    RestaurantData('Gubuk Lapar', 'Bandar Lampung', 2.1, 'rm4.png'),
    RestaurantData('Warteg Jawir', 'Bandar Lampung', 3.5, 'rm5.png'),
    RestaurantData('Warteg Mantap', 'Bandar Lampung', 1.8, 'rm6.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Resto Favorit",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(25.0),
        color: Color.fromARGB(255, 255, 255, 255),
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (int i = 0; i < restaurants.length; i += 2)
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: RestaurantItem(restaurants[i]),
                      ),
                    ),
                    if (i + 1 < restaurants.length)
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: RestaurantItem(restaurants[i + 1]),
                        ),
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class RestaurantData {
  final String name;
  final String address;
  final double distance;
  final String imagePath;

  RestaurantData(this.name, this.address, this.distance, this.imagePath);
}


class RestaurantItem extends StatelessWidget {
  final RestaurantData restaurant;

  RestaurantItem(this.restaurant);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: Colors.white, 
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFFB9701)), 
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/images/${restaurant.imagePath}',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  restaurant.name,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  restaurant.address,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text(
                  '${restaurant.distance} km',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


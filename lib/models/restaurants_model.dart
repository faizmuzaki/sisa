class Restaurant {
  late String coordinates;
  late int highestPrice;
  late String image;
  late int lowestPrice;
  late String placeName;

  Restaurant({
    required this.coordinates,
    required this.highestPrice,
    required this.image,
    required this.lowestPrice,
    required this.placeName,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      coordinates: json['coordinates'],
      highestPrice: json['highest_price'],
      image: json['image'],
      lowestPrice: json['lowest_price'],
      placeName: json['place_name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'coordinates': coordinates,
      'highest_price': highestPrice,
      'image': image,
      'lowest_price': lowestPrice,
      'place_name': placeName,
    };
    return {data['place_name']: data};
  }
}

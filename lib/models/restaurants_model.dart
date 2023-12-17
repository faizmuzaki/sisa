class Restaurant {
  late String coordinates;
  late int highestPrice;
  late String image;
  late int lowestPrice;
  late String placeName;
  late String type;
  late int discount;
  late double rate;

  Restaurant({
    required this.coordinates,
    required this.highestPrice,
    required this.image,
    required this.lowestPrice,
    required this.placeName,
    required this.type,
    required this.discount,
    required this.rate,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      coordinates: json['coordinates'],
      highestPrice: json['highest_price'],
      image: json['image'],
      lowestPrice: json['lowest_price'],
      placeName: json['place_name'],
      type: json['type'],
      discount: json['discount'],
      rate: json['rate'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'coordinates': coordinates,
      'highest_price': highestPrice,
      'image': image,
      'lowest_price': lowestPrice,
      'place_name': placeName,
      'type': type,
      'discount': discount,
      'rate': rate,
    };
    return {data['place_name']: data};
  }
}

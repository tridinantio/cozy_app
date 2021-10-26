// To parse this JSON data, do
//
//     final Space = SpaceFromJson(jsonString);

import 'dart:convert';

Space SpaceFromJson(String str) => Space.fromJson(json.decode(str));

String SpaceToJson(Space data) => json.encode(data.toJson());

class Space {
  Space({
    required this.id,
    required this.name,
    required this.city,
    required this.country,
    required this.price,
    required this.imageUrl,
    required this.rating,
    required this.address,
    required this.phone,
    required this.mapUrl,
    required this.photos,
    required this.numberOfKitchens,
    required this.numberOfBedrooms,
    required this.numberOfCupboards,
  });

  late int id = 0;
  late String name = "";
  late String city = "";
  late String country = "";
  late int price = 0;
  late String imageUrl = "";
  late int rating = 0;
  late String address = "";
  late String phone = "";
  late String mapUrl = "";
  late List<String> photos = [];
  late int numberOfKitchens = 0;
  late int numberOfBedrooms = 0;
  late int numberOfCupboards = 0;

  // factory Space.fromJson(json) => Space(
  //       id: json["id"],
  //       name: json["name"],
  //       city: json["city"],
  //       country: json["country"],
  //       price: json["price"],
  //       imageUrl: json["image_url"],
  //       rating: json["rating"],
  //       address: json["address"],
  //       phone: json["phone"],
  //       mapUrl: json["map_url"],
  //       photos: List<String>.from(json["photos"].map((x) => x)),
  //       numberOfKitchens: json["number_of_kitchens"],
  //       numberOfBedrooms: json["number_of_bedrooms"],
  //       numberOfCupboards: json["number_of_cupboards"],
  //     );

  Space.fromJson(json) {
    id = json["id"];
    name = json["name"];
    city = json["city"];
    country = json["country"];
    price = json["price"];
    imageUrl = json["image_url"];
    rating = json["rating"];
    address = json["address"];
    phone = json["phone"];
    mapUrl = json["map_url"];
    photos = List<String>.from(json["photos"].map((x) => x));
    numberOfKitchens = json["number_of_kitchens"];
    numberOfBedrooms = json["number_of_bedrooms"];
    numberOfCupboards = json["number_of_cupboards"];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "city": city,
        "country": country,
        "price": price,
        "image_url": imageUrl,
        "rating": rating,
        "address": address,
        "phone": phone,
        "map_url": mapUrl,
        "photos": List<dynamic>.from(photos.map((x) => x)),
        "number_of_kitchens": numberOfKitchens,
        "number_of_bedrooms": numberOfBedrooms,
        "number_of_cupboards": numberOfCupboards,
      };
}

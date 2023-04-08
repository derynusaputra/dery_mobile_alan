// To parse this JSON data, do
//
//     final cardModel = cardModelFromMap(jsonString);

import 'dart:convert';

CardModel cardModelFromMap(String str) => CardModel.fromMap(json.decode(str));

String cardModelToMap(CardModel data) => json.encode(data.toMap());

class CardModel {
  CardModel({
    required this.foodCode,
    required this.name,
    required this.picture,
    required this.pictureOri,
    required this.createdAt,
    required this.price,
    required this.id,
  });

  String foodCode;
  String name;
  String picture;
  String pictureOri;
  DateTime createdAt;
  String price;
  int id;

  // dari map ke model
  factory CardModel.fromMap(Map<String, dynamic> json) => CardModel(
        foodCode: json["food_code"],
        name: json["name"],
        picture: json["picture"],
        pictureOri: json["picture_ori"].toString(),
        createdAt: DateTime.parse(json["created_at"]),
        price: json["price"].toString(),
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "food_code": foodCode,
        "name": name,
        "picture": picture,
        "picture_ori": pictureOri,
        "created_at": createdAt.toIso8601String(),
        "price": price,
        "id": id,
      };
}

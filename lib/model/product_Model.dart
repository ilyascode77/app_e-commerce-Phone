// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  String id;
  String name;
  String image;
  bool isFavorite;
  int price;
  String description ;
  int preparations;


  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFavorite,
    required this.price,
    required this.description,
    required this.preparations,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    isFavorite: json["isFavorite"],
    price: json["price"],
    description: json["description"],
    preparations: json["preparations"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "isFavorite":isFavorite,
    "price":price,
    "description":description,
    "preparations":preparations,
  };
}

// To parse this JSON data, do
//
//     final foodModel = foodModelFromJson(jsonString);

import 'dart:convert';

List<FoodModel> foodModelFromJson(String str) => List<FoodModel>.from(json.decode(str).map((x) => FoodModel.fromJson(x)));

String foodModelToJson(List<FoodModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FoodModel {
  FoodModel({
    this.name,
    this.ingredients,
    this.steps,
    this.timers,
    this.imageUrl,
    this.originalUrl,
  });

  String name;
  List<Ingredient> ingredients;
  List<String> steps;
  List<int> timers;
  String imageUrl;
  String originalUrl;

  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
    name: json["name"],
    ingredients: List<Ingredient>.from(json["ingredients"].map((x) => Ingredient.fromJson(x))),
    steps: List<String>.from(json["steps"].map((x) => x)),
    timers: List<int>.from(json["timers"].map((x) => x)),
    imageUrl: json["imageURL"],
    originalUrl: json["originalURL"] == null ? null : json["originalURL"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
    "steps": List<dynamic>.from(steps.map((x) => x)),
    "timers": List<dynamic>.from(timers.map((x) => x)),
    "imageURL": imageUrl,
    "originalURL": originalUrl == null ? null : originalUrl,
  };
}

class Ingredient {
  Ingredient({
    this.quantity,
    this.name,
    this.type,
  });

  String quantity;
  String name;
  Type type;

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
    quantity: json["quantity"],
    name: json["name"],
    type: typeValues.map[json["type"]],
  );

  Map<String, dynamic> toJson() => {
    "quantity": quantity,
    "name": name,
    "type": typeValues.reverse[type],
  };
}

enum Type { MEAT, BAKING, CONDIMENTS, DRINKS, PRODUCE, MISC, DAIRY }

final typeValues = EnumValues({
  "Baking": Type.BAKING,
  "Condiments": Type.CONDIMENTS,
  "Dairy": Type.DAIRY,
  "Drinks": Type.DRINKS,
  "Meat": Type.MEAT,
  "Misc": Type.MISC,
  "Produce": Type.PRODUCE
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

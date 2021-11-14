import 'dart:convert';

List<VRProduct> productFromJson(String str) =>
    List<VRProduct>.from(json.decode(str).map((x) => VRProduct.fromJson(x)));

String productToJson(List<VRProduct> data) =>
    json.encode(List<VRProduct>.from(data.map((x) => x.toJson())));

class VRProduct {
  VRProduct({
    required this.id,
    required this.title,
    required this.price,
    required this.rating,
    required this.description,
    required this.images,
  });

  String id;
  String title;
  String price;
  double rating;
  String description;
  String images;

  factory VRProduct.fromJson(Map<String, dynamic> json) => VRProduct(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        rating: json["rating"].toDouble(),
        description: json["description"],
        images: json["images"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "rating": rating,
        "description": description,
        "images": images,
      };
}

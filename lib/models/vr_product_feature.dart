import 'dart:convert';

ProductFeature productFeatureFromJson(String str) =>
    ProductFeature.fromJson(json.decode(str));

String productFeatureToJson(ProductFeature data) => json.encode(data.toJson());

class ProductFeature {
  ProductFeature({
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

  factory ProductFeature.fromJson(Map<String, dynamic> json) => ProductFeature(
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

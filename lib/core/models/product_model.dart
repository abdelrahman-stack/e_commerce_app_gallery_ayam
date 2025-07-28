

import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/models/review_model.dart';

class ProductModel {
  final String name;
  final String description;
  final num price;

  final String code;
  final num sellingCount;
  final bool isFeatured;
  String? imageUrl;
  final num avgRating ;
  final num ratingCount = 0;
  final List<ReviewModel> reviews;

  ProductModel({
    required this.reviews,
    required this.name,
    required this.sellingCount,
    required this.description,
    required this.price,
    required this.avgRating,
    required this.code,
    required this.isFeatured,
    this.imageUrl,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
  final reviewsJson = json['reviews'] as List<dynamic>? ?? [];
  return ProductModel(
    avgRating: getAvgrating(reviewsJson),
    sellingCount: json['sellingCount'] ?? 0,
    name: json['name'],
    description: json['description'],
    price: json['price'],
    code: json['code'],
    isFeatured: json['isFeatured'],
    imageUrl: json['imageUrl'],
    reviews: reviewsJson.map((e) => ReviewModel.fromJson(e)).toList(),
  );
}

  ProductEntity toEntity() => ProductEntity(
    pices: price.toInt(),
    name: name,
    description: description,
    price: price,
    code: code,
    isFeatured: isFeatured,
    imageUrl: imageUrl,
    reviews: reviews.map((e) => e.toEntity()).toList(),
  );
  toJson() => {
    'name': name,
    'description': description,
    'price': price,
    'code': code,
    'isFeatured': isFeatured,
    'imageUrl': imageUrl,
    'reviews': reviews.map((e) => e.toJson()).toList(),
  };
}

double getAvgrating(List<dynamic> reviewsJson) {
  if (reviewsJson.isEmpty) return 0;
  double sum = 0.0;
  for (var e in reviewsJson) {
    final review = ReviewModel.fromJson(e).toEntity();
    sum += review.ratting;
  }
  return sum / reviewsJson.length;
}


import 'package:e_commerce_app/core/entities/review_entity.dart';
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String name;
  final String description;
  final num price;
  final int pices;

  final String code;
  final bool isFeatured;
  String? imageUrl;
  final num avgRating = 0;
  final num ratingCount = 0;
final  List<ReviewEntity> reviews;

  ProductEntity({
    required this.reviews,
    required this.name,
    required this.description,
    required this.price,
  required this.pices,
    required this.code,
    required this.isFeatured,
    this.imageUrl,
  });
  
  @override
  
  List<Object?> get props => [code,name];
}


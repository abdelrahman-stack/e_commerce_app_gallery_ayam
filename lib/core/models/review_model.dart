
import 'package:e_commerce_app/core/entities/review_entity.dart';

class ReviewModel {
  final String name;
  final String image;
  final String reviewDescription;
  final String date;
  final num ratting;

  ReviewModel({
    required this.name,
    required this.image,
    required this.reviewDescription,
    required this.date,
    required this.ratting,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['name'],
      image: json['image'],
      reviewDescription: json['reviewDescription'],
      date: json['date'],
      ratting: json['ratting'],
    );
  }
  factory ReviewModel.fromEntity(ReviewEntity reviewEntity) {
    return ReviewModel(
      name: reviewEntity.name,
      image: reviewEntity.image,
      reviewDescription: reviewEntity.reviewDescription,
      date: reviewEntity.date,
      ratting: reviewEntity.ratting,
    );
  }
  ReviewEntity toEntity(){
    return ReviewEntity(
      name: name,
      image: image,
      reviewDescription: reviewDescription,
      date: date,
      ratting: ratting,
    );
   }
  toJson() => {
        'name': name,
        'image': image,
        'reviewDescription': reviewDescription,
        'date': date,
        'ratting': ratting,
      };
}

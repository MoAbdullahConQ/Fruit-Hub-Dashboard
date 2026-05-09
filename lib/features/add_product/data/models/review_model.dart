import 'package:fruit_hub_dashboard/features/add_product/domain/review_entity.dart';

class ReviewModel {
  final String name;
  final String image;
  final String reviewDescription;
  final String date;
  final num rating;

  ReviewModel({
    required this.name,
    required this.image,
    required this.reviewDescription,
    required this.rating,
    required this.date,
  });

  factory ReviewModel.fromEntity(ReviewEntity reviewEntity) {
    return ReviewModel(
      name: reviewEntity.name,
      image: reviewEntity.image,
      reviewDescription: reviewEntity.reviewDescription,
      rating: reviewEntity.rating,
      date: reviewEntity.date,
    );
  }

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['userName'],
      image: json['userImage'],
      reviewDescription: json['reviewText'],
      rating: json['rating'],
      date: json['date'],
    );
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'reviewText': reviewDescription,
      'rating': rating,
      'date': date,
    };
  }
}

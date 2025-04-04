import 'package:flutter_app/models/user_model.dart';

class ApartmentModel {
  final int id;
  final UserModel? user;
  final String title;
  final String governorate;
  final String? city;
  final String? street;
  final double price;
  final String? longDescription;
  final String? shortDescription;
  final String apartmentType;
  final List<String> images;
  final List<String> features;

  final double rating;
  final List<String> imageUrls;

  ApartmentModel({
    required this.id,
    required this.user,
    required this.title,
    required this.governorate,
    this.city,
    this.street,
    this.price = 0.0,
    this.longDescription,
    this.shortDescription,
    required this.apartmentType,
    this.images = const [],
    this.features = const [],
    this.rating = 0.0,
    this.imageUrls = const [],
  });

  factory ApartmentModel.fromJson(Map<String, dynamic> json) {
    return ApartmentModel(
      id: int.tryParse(json['id'].toString()) ?? 0,
      user: UserModel.fromMap(json['user']),
      title: json['title'].toString(),
      governorate: json['governorate'].toString(),
      city: json['city'],
      street: json['street'],
      price: double.tryParse(json['price'].toString()) ?? 0.0,
      longDescription: json['long_description'],
      shortDescription: json['short_description'],
      apartmentType: json['apartment_type'],
      images: List<String>.from(json['images'] ?? []),
      features: List<String>.from(json['features'] ?? []),
      rating: double.tryParse(json['rating'].toString()) ?? 0.0,
      imageUrls: List<String>.from(json['image_urls'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': user?.toJson(),
      'title': title,
      'governorate': governorate,
      'city': city,
      'street': street,
      'price': price,
      'long_description': longDescription,
      'short_description': shortDescription,
      'apartment_type': apartmentType,
      'images': images,
      'rating': rating,
      'features': features
    };
  }
}

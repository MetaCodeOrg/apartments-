import 'package:flutter/material.dart';
import 'package:flutter_app/features/details/controller/detalis_controller.dart';
import 'package:flutter_app/features/home/controller/apartment_controller.dart';
import 'package:flutter_app/models/apartment_model.dart';
import 'package:flutter_app/services/api/api_services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'screens/publisher_profile.dart';

class PropertyDetailScreen extends GetView<ApartmentController> {
  final ApartmentModel model;
  const PropertyDetailScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    var url = "${ApiServices.serverImage}${model.imageUrls.first}";

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Header with image, rating, and back button
                    Stack(
                      children: [
                        // Main property image
                        Container(
                          height: 280,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(url),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        // Back button and profile icon
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.arrow_back,
                                      color: Colors.black),
                                  onPressed: () {
                                    Get.back();
                                  },
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.person_outline,
                                      color: Colors.black),
                                  onPressed: () {
                                    if (model.user != null) {
                                      Get.to(() => PublisherProfileScreen(
                                          publisher: model.user!));
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Rating stars
                        Positioned(
                          top: 16,
                          left: 16,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(5, (index) {
                                return Icon(
                                  index < model.rating.floor()
                                      ? Icons.star
                                      : (index < model.rating
                                          ? Icons.star_half
                                          : Icons.star_border),
                                  color: Colors.amber,
                                  size: 11.sp,
                                );
                              }),
                            ),
                          ),
                        ),

                        // Property thumbnails
                        Positioned(
                          bottom: 16,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Container(
                              height: 70,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ...model.imageUrls
                                      .take(4)
                                      .map((imageUrl) => Padding(
                                            padding:
                                                const EdgeInsets.only(right: 8),
                                            child: _buildThumbnail(
                                                "${ApiServices.serverImage}$imageUrl"),
                                          ))
                                      .toList(),
                                  if (model.imageUrls.length > 4)
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.7),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '+${model.imageUrls.length - 4}',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Property info
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Price and title in Arabic
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  model.title,
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '${model.price / 100}\$',
                                style: TextStyle(
                                  color: Colors.orange[400],
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),

                          // Location
                          Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Icon(Icons.location_on,
                                  color: Colors.grey, size: 20),
                              SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  "${model.governorate} .. ${model.city} ${model.street}",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const Divider(height: 32),

                          // Property features (in Arabic)
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ':تتكون من',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 8),
                              ...model.features
                                  .map((e) => Padding(
                                        padding: EdgeInsets.only(bottom: 8),
                                        child: Row(
                                          textDirection: TextDirection.rtl,
                                          children: [
                                            Icon(Icons.check_circle,
                                                color: Colors.green, size: 18),
                                            SizedBox(width: 8),
                                            Text(
                                              e,
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ))
                                  .toList(),
                            ],
                          ),

                          const Divider(height: 32),

                          // Property description
                          Text(
                            model.shortDescription ?? "",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 16,
                              height: 1.5,
                            ),
                            textDirection: TextDirection.rtl,
                          ),

                          const SizedBox(height: 24),

                          // Apply/Request Button
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () => Get.find<DetalisController>()
                                  .sendOrder(model.id),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                'طلب تأجير',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThumbnail(String imageUrl) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
        border: Border.all(color: Colors.white, width: 2),
      ),
    );
  }
}

class _ArabicFeatureItem extends StatelessWidget {
  final String text;

  const _ArabicFeatureItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(
          text,
          textAlign: TextAlign.right,
          style: const TextStyle(fontSize: 14),
          textDirection: TextDirection.rtl,
        ),
      ),
    );
  }
}

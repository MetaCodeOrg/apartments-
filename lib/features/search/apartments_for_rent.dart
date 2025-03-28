import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/assets/images.dart';
import 'package:get/get.dart';

import '../../core/constants/widgets/rental_property_card.dart';

class ApartmentsForRent extends StatelessWidget {
  const ApartmentsForRent({super.key});

  @override
  Widget build(BuildContext context) {
    final rentalProperties = [
      RentalPropertyCard(
        image: AppImages.home1,
        title: "khaled_building".tr,
        location: "khaled_building_location".tr,
        rating: 4,
      ),
      RentalPropertyCard(
        image: AppImages.home2,
        title: "unity_building".tr,
        location: "unity_building_location".tr,
        rating: 3,
      ),
      RentalPropertyCard(
        image: AppImages.home3,
        title: "qabati_building".tr,
        location: "qabati_building_location".tr,
        rating: 3,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Apartments for rent'.tr),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'search_property_placeholder'.tr,
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 20),

            // نتائج البحث
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'search_results'.tr + ' (12)',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),

            ListView.separated(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: rentalProperties.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) => rentalProperties[index],
            ),
          ],
        ),
      ),
    );
  }
}

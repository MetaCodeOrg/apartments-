import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_routes.dart';
import 'package:flutter_app/core/constants/assets/images.dart';
import 'package:flutter_app/core/constants/widgets/property_card.dart';
import 'package:flutter_app/core/constants/widgets/rental_property_card.dart';

import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeader(),
          _buildSearchBar(),
          _buildFeaturedProperties(),
          const SizedBox(height: 10),
          _buildRentalProperties(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: Icon(Icons.person_outline, color: Colors.grey[800]),
          ),
          CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: IconButton(
              onPressed: () => {Get.toNamed('/setting')},
              icon: Icon(Icons.settings_outlined, color: Colors.grey[800]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Icon(Icons.search, color: Colors.grey),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text("search_placeholder".tr),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            backgroundColor: const Color(0xFF5097B5),
            radius: 20,
            child: IconButton(
              icon: const Icon(Icons.tune, color: Colors.white),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedProperties() {
    final properties = [
      PropertyCard(
        image: AppImages.home3,
        title: "modern_villa".tr,
        location: "modern_villa_location".tr,
        rating: 3.5,
      ),
      PropertyCard(
        image: AppImages.home4,
        title: "residential_city".tr,
        location: "residential_city_location".tr,
        rating: 4,
      ),
      PropertyCard(
        image: AppImages.home3,
        title: "modern_villa".tr,
        location: "modern_villa_location".tr,
        rating: 3.5,
      ),
    ];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "available_apartments".tr,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[700],
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.search);
                },
                child: Text("discover_all".tr),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 240,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 8,
              bottom: 20,
            ),
            itemCount: properties.length,
            separatorBuilder: (context, index) =>
                const SizedBox(width: 5), // مسافة ثابتة
            itemBuilder: (context, index) => properties[index],
          ),
        ),
      ],
    );
  }

  Widget _buildRentalProperties() {
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

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "rent_apartments".tr,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[700],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text("discover_all".tr),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: rentalProperties.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) => rentalProperties[index],
          ),
        ),
      ],
    );
  }
}

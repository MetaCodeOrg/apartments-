import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/widgets/property_card.dart';
import 'package:get/get.dart';
import 'package:flutter_app/core/constants/assets/images.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('search_property'.tr),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // فتح فلتر البحث
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // شريط البحث
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
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),

            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: List.generate(6, (index) {
                return PropertyCard(
                  image: index % 4 == 0 ? AppImages.home1 :
                         index % 4 == 1 ? AppImages.home2 :
                         index % 4 == 2 ? AppImages.home3 :
                         AppImages.home4,
                  title: "featured_property".tr,
                  location: "featured_location".tr,
                  rating: 4,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

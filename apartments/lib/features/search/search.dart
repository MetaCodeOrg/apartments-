import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/widgets/dialog_order.dart';
import 'package:flutter_app/core/constants/widgets/property_card.dart';
import 'package:flutter_app/features/details/details.dart';
import 'package:flutter_app/features/home/controller/apartment_controller.dart';
import 'package:flutter_app/services/api/api_services.dart';
import 'package:get/get.dart';

class SearchPage extends GetView<ApartmentController> {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        controller.searchApartments("", false);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('search_property'.tr),
          centerTitle: true,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              icon: const Icon(Icons.filter_list),
              onPressed: () {
                showSortDialog(context, false, controller);
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  controller.searchApartments(value, false);
                },
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
              Obx(() {
                return GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: List.generate(controller.apartmentsFurnished.length,
                      (index) {
                    var model = controller.apartmentsFurnished[index];
                    var url =
                        "${ApiServices.serverImage}${model.imageUrls.first}";
                    return PropertyCard(
                      image: url,
                      title: model.title,
                      location: model.governorate,
                      rating: model.rating,
                      onTap: () {
                        Get.to(() => PropertyDetailScreen(model: model));
                      },
                    );
                  }),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}

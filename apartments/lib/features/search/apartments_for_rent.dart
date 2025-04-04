import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/widgets/dialog_order.dart';
import 'package:flutter_app/core/constants/widgets/rental_property_card.dart';
import 'package:flutter_app/features/details/details.dart';
import 'package:flutter_app/features/home/controller/apartment_controller.dart';
import 'package:flutter_app/services/api/api_services.dart';
import 'package:get/get.dart';

class ApartmentsForRent extends GetView<ApartmentController> {
  const ApartmentsForRent({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        controller.searchApartments("", true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Apartments for rent'.tr),
          centerTitle: true,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              icon: const Icon(Icons.filter_list),
              onPressed: () {
                showSortDialog(context, true, controller);
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
                  controller.searchApartments(value, true);
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
                  'search_results'.tr +
                      ' (${controller.apartmentsRent.length})',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              Obx(() {
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: controller.apartmentsRent.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    var model = controller.apartmentsRent[index];
                    var url =
                        "${ApiServices.serverImage}${model.imageUrls.first}";
                    return RentalPropertyCard(
                      title: model.title,
                      location: model.governorate,
                      rating: model.rating,
                      image: url,
                      onTap: () {
                        Get.to(() => PropertyDetailScreen(model: model));
                      },
                    );
                  },
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}

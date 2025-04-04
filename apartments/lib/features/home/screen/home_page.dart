import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/core/class/statusrequest.dart';
import 'package:flutter_app/core/constants/app_routes.dart';
import 'package:flutter_app/core/constants/widgets/property_card.dart';
import 'package:flutter_app/core/constants/widgets/refresh_empty_widget.dart';
import 'package:flutter_app/core/constants/widgets/rental_property_card.dart';
import 'package:flutter_app/core/constants/widgets/title_list_data.dart';
import 'package:flutter_app/features/details/details.dart';
import 'package:flutter_app/features/home/controller/apartment_controller.dart';
import 'package:flutter_app/services/api/api_services.dart';

import 'package:get/get.dart';

class HomePage extends GetView<ApartmentController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeader(context),
          _buildSearchBar(context),
          Obx(() {
            if (controller.statusRequest.value == StatusRequest.loading) {
              return Container(
                width: Get.width,
                height: Get.height,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            if (controller.statusRequest.value != StatusRequest.success) {
              return RefreshEmptyWidget(
                emptyText: controller.statusRequest.value.text,
                icon: controller.statusRequest.value.icon,
                onRefresh: () async {
                  await controller.fetchApartments();
                },
              );
            }

            return Column(
              children: [
                TitleListData(
                  title: "available_apartments",
                  onTap: () {
                    Get.toNamed(
                      AppRoutes.search,
                    );
                  },
                ),
                if (controller.apartmentsFurnished.isEmpty)
                  RefreshEmptyWidget(
                    emptyText: "not found data",
                    onRefresh: () async {
                      await controller.fetchApartments();
                    },
                  ),
                if (controller.apartmentsFurnished.isNotEmpty)
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
                        itemCount: controller.apartmentsFurnished.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 5), // مسافة ثابتة
                        itemBuilder: (context, index) {
                          var model = controller.apartmentsFurnished[index];
                          var url =
                              "${ApiServices.serverImage}${model.imageUrls.first}";

                          return PropertyCard(
                            title: model.title,
                            location: model.governorate,
                            rating: model.rating,
                            image: url,
                            onTap: () {
                              Get.to(() => PropertyDetailScreen(model: model));
                            },
                          );
                        }),
                  ),

                const SizedBox(height: 10),
                // _buildRentalProperties(),
                TitleListData(
                  title: "rent_apartments",
                  onTap: () {
                    Get.toNamed(
                      AppRoutes.apartmentsFoRent,
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView.separated(
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
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.person_outline, color: Colors.grey[800])),
          ),
          CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: IconButton(
              onPressed: () => {Get.toNamed(AppRoutes.settings)},
              icon: Icon(Icons.settings_outlined, color: Colors.grey[800]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
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
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "search_placeholder".tr,
                    border: InputBorder.none,
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  onChanged: (value) {
                    controller.searchApartments(value, false);
                    controller.searchApartments(value, true);
                  },
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
              onPressed: () => _showSortDialog(context, true),
            ),
          ),
        ],
      ),
    );
  }

  // Add this method to show sort options
  void _showSortDialog(BuildContext context, bool isRentList) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('sort_options'.tr),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text('price_low_to_high'.tr),
              onTap: () {
                controller.sortApartments(SortOption.priceAsc, isRentList);
                controller.sortApartments(SortOption.priceAsc, !isRentList);

                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('price_high_to_low'.tr),
              onTap: () {
                controller.sortApartments(SortOption.priceDesc, isRentList);
                controller.sortApartments(SortOption.priceDesc, !isRentList);

                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('rating_low_to_high'.tr),
              onTap: () {
                controller.sortApartments(SortOption.ratingAsc, isRentList);
                controller.sortApartments(SortOption.ratingAsc, !isRentList);

                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('rating_high_to_low'.tr),
              onTap: () {
                controller.sortApartments(SortOption.ratingDesc, isRentList);
                controller.sortApartments(SortOption.ratingAsc, !isRentList);

                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

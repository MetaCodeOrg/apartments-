// Add this method to show sort options
import 'package:flutter/material.dart';
import 'package:flutter_app/features/home/controller/apartment_controller.dart';
import 'package:mc_utils/mc_utils.dart';

void showSortDialog(
    BuildContext context, bool isRentList, ApartmentController controller) {
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

              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('price_high_to_low'.tr),
            onTap: () {
              controller.sortApartments(SortOption.priceDesc, isRentList);

              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('rating_low_to_high'.tr),
            onTap: () {
              controller.sortApartments(SortOption.ratingAsc, isRentList);

              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('rating_high_to_low'.tr),
            onTap: () {
              controller.sortApartments(SortOption.ratingDesc, isRentList);

              Navigator.pop(context);
            },
          ),
        ],
      ),
    ),
  );
}

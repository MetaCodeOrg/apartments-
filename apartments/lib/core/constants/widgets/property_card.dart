// property_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mc_utils/mc_utils.dart';

class PropertyCard extends StatelessWidget {
  final String image;
  final String title;
  final String location;
  final double rating;
  final Function()? onTap;

  const PropertyCard({
    super.key,
    required this.image,
    required this.title,
    required this.location,
    required this.rating,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 180,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        // في دالة build الخاصة بـ PropertyCard
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: McImageNetWork(
                url: image,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on,
                          size: 16, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Expanded(
                        child: McText(
                          txt: location,
                          fontSize: 12,
                          color: Colors.grey[600],
                          line: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  McText(
                    txt: title,
                    fontSize: 14,
                    blod: true,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return Icon(
                        index < rating.floor()
                            ? Icons.star
                            : (index < rating
                                ? Icons.star_half
                                : Icons.star_border),
                        color: Colors.amber,
                        size: 11.sp,
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

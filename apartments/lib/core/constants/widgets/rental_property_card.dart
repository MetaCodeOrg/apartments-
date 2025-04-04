// rental_property_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mc_utils/mc_utils.dart';

class RentalPropertyCard extends StatelessWidget {
  final String image;
  final String title;
  final String location;
  final double rating;
  final Function()? onTap;

  const RentalPropertyCard({
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
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3), // زيادة شدة الظل
              spreadRadius: 1,
              blurRadius: 8, // زيادة طمس الظل
              offset: const Offset(0, 4), // زيادة إزاحة الظل للأسفل
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
                child: McImageNetWork(
                  url: image,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    McText(
                      txt: title,
                      fontSize: 16,
                      blod: true,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.location_on,
                            size: 16, color: Colors.grey[600]),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            location,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
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
            ),
          ],
        ),
      ),
    );
  }
}

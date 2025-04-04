import 'package:flutter/material.dart';
import 'package:mc_utils/mc_utils.dart';

class TitleListData extends StatelessWidget {
  final String title;
  final Function()? onTap;
  const TitleListData({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title.tr,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.teal[700],
            ),
          ),
          TextButton(
            onPressed: onTap,
            child: Text("discover_all".tr),
          ),
        ],
      ),
    );
  }
}

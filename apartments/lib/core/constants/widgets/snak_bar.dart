import 'package:flutter/material.dart';
import 'package:mc_utils/mc_utils.dart';
import 'package:get/get.dart';

void showSnakBar({
  required String title,
  required String msg,
  Color? color,
  IconData? icon,
  int time=3
}) {
  Get.showSnackbar(
    GetSnackBar(
      titleText: Row(
        children: [
          Icon(icon ?? Icons.info_outline, color: Colors.white, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title.tr,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      messageText: Text(
        msg,
        style: const TextStyle(fontSize: 14, color: Colors.white),
      ),
      backgroundColor: color ?? const Color(0xFF303030),
      borderRadius: 12,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      boxShadows: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
      duration: 
       Duration(seconds: time),
      snackStyle: SnackStyle.FLOATING,
    ),
  );
}

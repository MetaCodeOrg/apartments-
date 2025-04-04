import 'package:flutter/material.dart';
import 'package:flutter_app/features/user/controller/user_controller.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<UserController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        elevation: 0,
        title: Text('profile'.tr),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: GetBuilder<UserController>(
        builder: (controller) => SingleChildScrollView(
          child: Column(
            children: [
              _buildProfileHeader(),
              const SizedBox(height: 20),
              _buildProfileDetails(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.teal[100],
                child: Text(
                  controller.userModel?.username
                          .substring(0, 1)
                          .toUpperCase() ??
                      '',
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.edit, size: 20, color: Colors.teal),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            controller.userModel?.username ?? '',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            controller.userModel?.email ?? '',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            _buildProfileItem(
              icon: Icons.phone,
              title: 'phone'.tr,
              value: controller.userModel?.phoneNumber ?? '',
            ),
            const Divider(height: 1),
            _buildProfileItem(
              icon: Icons.person_outline,
              title: 'account_type'.tr,
              value: controller.userModel?.userType ?? '',
            ),
            const Divider(height: 1),
            _buildProfileItem(
              icon: Icons.verified_user,
              title: 'verification_status'.tr,
              value: controller.userModel?.isEmailVerified == true
                  ? 'verified'.tr
                  : 'not_verified'.tr,
              valueColor: controller.userModel?.isEmailVerified == true
                  ? Colors.green
                  : Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem({
    required IconData icon,
    required String title,
    required String value,
    Color? valueColor,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.teal[50],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.teal),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  color: valueColor ?? Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

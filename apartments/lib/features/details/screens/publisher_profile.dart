import 'package:flutter/material.dart';
import 'package:flutter_app/models/user_model.dart';
import 'package:get/get.dart';

class PublisherProfileScreen extends StatelessWidget {
  final UserModel publisher;

  const PublisherProfileScreen({super.key, required this.publisher});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('publisher_profile'.tr),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildPublisherHeader(),
            const SizedBox(height: 20),
            _buildPublisherInfo(),
            const SizedBox(height: 20),
            _buildContactSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildPublisherHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.teal[100],
            child: Text(
              publisher.username.substring(0, 1).toUpperCase(),
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            publisher.username,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            publisher.userType ?? 'publisher'.tr,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPublisherInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoItem(
                icon: Icons.email_outlined,
                title: 'email'.tr,
                value: publisher.email,
              ),
              const Divider(),
              _buildInfoItem(
                icon: Icons.phone_outlined,
                title: 'phone'.tr,
                value: publisher.phoneNumber ?? 'not_available'.tr,
              ),
              // if (publisher.address != null) ...[
              //   const Divider(),
              //   _buildInfoItem(
              //     icon: Icons.location_on_outlined,
              //     title: 'address'.tr,
              //     value: publisher.address!,
              //   ),
              // ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ElevatedButton.icon(
            onPressed: () {
              // Implement call functionality
            },
            icon: const Icon(Icons.phone),
            label: Text('call_publisher'.tr),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: () {
              // Implement message functionality
            },
            icon: const Icon(Icons.message),
            label: Text('message_publisher'.tr),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.teal,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.teal, size: 24),
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
                style: const TextStyle(
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

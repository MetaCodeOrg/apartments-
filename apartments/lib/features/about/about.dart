import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/assets/images.dart';
import 'package:get/get.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('about_us'.tr),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                AppImages.logo,
                height: 120,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'who_we_are'.tr,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'who_we_are_desc'.tr,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 30),
            Text(
              'our_vision'.tr,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'our_vision_desc'.tr,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 30),
            Text(
              'team'.tr,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildTeamMember('يونس', 'مدير عام'),
                  _buildTeamMember('عزوز', 'مستشار عقاري'),
                  _buildTeamMember('فاطمة', 'مسوقة'),
                  _buildTeamMember('ذكرى', 'دعم فني'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamMember(String name, String position) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.teal[100],
            child: Text(
              name.substring(0, 1),
              style: const TextStyle(fontSize: 24, color: Colors.teal),
            ),
          ),
          const SizedBox(height: 5),
          Text(name),
          Text(
            position.tr,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

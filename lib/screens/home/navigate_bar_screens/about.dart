import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('معلومات عنا'),
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
                'assets/images/logo.png',
                height: 120,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'من نحن',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'نحن منصة عقارية رائدة تهدف إلى توفير حلول سكنية وعقارية مميزة لعملائنا الكرام. نقدم خدماتنا منذ عام 2020 ولدينا آلاف العملاء الراضين عن خدماتنا.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 30),
            const Text(
              'رؤيتنا',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'أن نكون الخيار الأول للباحثين عن حلول سكنية وعقارية في المنطقة من خلال تقديم خدمات متميزة وشفافة.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 30),
            const Text(
              'فريق العمل',
              style: TextStyle(
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
            position,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

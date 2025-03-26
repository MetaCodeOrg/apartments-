import 'package:flutter/material.dart';
import 'package:flutter_app/screens/auth/controller/auth_controller.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('الإعدادات'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSettingsSection('الحساب', [
            _buildSettingsItem(
              icon: Icons.person_outline,
              title: 'الملف الشخصي',
              onTap: () {},
            ),
            _buildSettingsItem(
              icon: Icons.notifications_outlined,
              title: 'الإشعارات',
              onTap: () {},
            ),
            _buildSettingsItem(
              icon: Icons.lock_outline,
              title: 'الأمان',
              onTap: () {},
            ),
          ]),
          const SizedBox(height: 20),
          _buildSettingsSection('عام', [
            _buildSettingsItem(
              icon: Icons.language,
              title: 'اللغة',
              trailing: 'العربية',
              onTap: () {},
            ),
            _buildSettingsItem(
              icon: Icons.help_outline,
              title: 'المساعدة',
              onTap: () {},
            ),
            _buildSettingsItem(
              icon: Icons.info_outline,
              title: 'عن التطبيق',
              trailing: 'الإصدار 1.0.0',
              onTap: () {},
            ),
          ]),
          const SizedBox(height: 20),
          GetBuilder<AuthController>(
            builder: (controller) => _buildSettingsItem(
              icon: Icons.logout,
              title: 'تسجيل الخروج',
              color: Colors.red,
              onTap: controller.logout,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
        ),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    String? trailing,
    Color? color,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: color ?? Colors.teal),
      title: Text(
        title,
        style: TextStyle(color: color ?? Colors.black),
      ),
      trailing: trailing != null
          ? Text(trailing, style: TextStyle(color: Colors.grey[600]))
          : const Icon(Icons.chevron_left),
      onTap: onTap,
    );
  }
}

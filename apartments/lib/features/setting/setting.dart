import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/app_routes.dart';
import 'package:flutter_app/core/pereferences/shared_pref.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('settings'.tr),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSettingsSection('account'.tr, [
            _buildSettingsItem(
              icon: Icons.person_outline,
              title: 'profile'.tr,
              onTap: () => Get.toNamed(AppRoutes.profile),
            ),
            _buildSettingsItem(
              icon: Icons.notifications_outlined,
              title: 'notifications'.tr,
              onTap: () => Get.toNamed(AppRoutes.notification),
            ),
            _buildSettingsItem(
              icon: Icons.lock_outline,
              title: 'security'.tr,
              onTap: () => Get.toNamed(AppRoutes.security),
            ),
          ]),
          const SizedBox(height: 20),
          _buildSettingsSection('general'.tr, [
            _buildSettingsItem(
              icon: Icons.language,
              title: 'language'.tr,
              trailing: 'arabic'.tr,
              onTap: () => Get.toNamed(AppRoutes.langugue),
            ),
            _buildSettingsItem(
              icon: Icons.help_outline,
              title: 'help'.tr,
              onTap: () {},
            ),
            _buildSettingsItem(
              icon: Icons.info_outline,
              title: 'about_app'.tr,
              trailing: '${'app_version'.tr} 1.0.0',
              onTap: () {},
            ),
          ]),
          const SizedBox(height: 20),
          _buildSettingsItem(
            icon: Icons.logout,
            title: 'logout'.tr,
            color: Colors.red,
            onTap: () {
              SharedPrefs.setBoolean(SharedPrefs.isLogin, false);
              Get.offAllNamed(AppRoutes.home);
            },
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

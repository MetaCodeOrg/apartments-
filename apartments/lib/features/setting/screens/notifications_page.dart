import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('notifications'.tr),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('push_notifications'.tr),
            value: true,
            onChanged: (value) {},
          ),
          SwitchListTile(
            title: Text('email_notifications'.tr),
            value: false,
            onChanged: (value) {},
          ),
          SwitchListTile(
            title: Text('promotional_notifications'.tr),
            value: true,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
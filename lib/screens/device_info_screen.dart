import 'dart:io';

import 'package:flutter/material.dart';

import 'package:poc_get_device_info/widgets/android_content.dart';
import 'package:poc_get_device_info/widgets/ios_content.dart';

class DeviceInfoScreen extends StatelessWidget {
  const DeviceInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void getDeviceInfo() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return Platform.isAndroid
                ? const AndroidContent()
                : const IosContent();
          },
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: getDeviceInfo,
          child: const Text('Get Device Info'),
        ),
      ),
    );
  }
}

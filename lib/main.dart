import 'package:flutter/material.dart';
import 'package:poc_get_device_info/screens/device_info_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DeviceInfoScreen(),
    );
  }
}

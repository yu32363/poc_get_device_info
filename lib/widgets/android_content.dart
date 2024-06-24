import 'package:flutter/material.dart';

import 'package:device_info_plus/device_info_plus.dart';

class AndroidContent extends StatefulWidget {
  const AndroidContent({super.key});

  @override
  State<AndroidContent> createState() => _AndroidContentState();
}

class _AndroidContentState extends State<AndroidContent> {
  String deviceId = '...';
  String brand = '...';
  String serialNumber = '...';
  String deviceModel = '...';
  String deviceName = '...';
  String systemVersion = '...';

  @override
  void initState() {
    super.initState();
    getDeviceInfo();
  }

  Future getDeviceInfo() async {
    try {
      DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

      AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      setState(() {
        brand = androidInfo.brand;
        serialNumber = androidInfo.serialNumber;
        deviceModel = androidInfo.model;
        deviceName = androidInfo.device;
        systemVersion = androidInfo.version.release;
      });
    } catch (e) {
      return 'Cannot get device info: $e';
    }
  }

  Future getDeviceId() async {
    try {
      DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

      AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      setState(() {
        deviceId = androidInfo.id;
      });
    } catch (e) {
      setState(() {
        deviceId = 'Error fetching device id';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Device Info - Android'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Brand: $brand',
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Serial Number: $serialNumber',
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Model: $deviceModel',
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Name: $deviceName',
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'System Version: $systemVersion',
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: getDeviceId,
                  child: const Text('Get Device ID'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Device ID: $deviceId',
                ),
              ],
            ),
          ),
        ));
  }
}

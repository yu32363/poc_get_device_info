import 'package:flutter/material.dart';

import 'package:device_info_plus/device_info_plus.dart';

class IosContent extends StatefulWidget {
  const IosContent({super.key});

  @override
  State<IosContent> createState() => _IosContentState();
}

class _IosContentState extends State<IosContent> {
  String deviceId = '...';
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

      IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
      setState(() {
        deviceModel = iosInfo.model;
        deviceName = iosInfo.name;
        systemVersion = iosInfo.systemVersion;
      });
    } catch (e) {
      return 'Cannot get device info: $e';
    }
  }

  Future getDeviceId() async {
    try {
      DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

      IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
      setState(() {
        deviceId = iosInfo.identifierForVendor.toString();
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
          title: const Text('Device Info - iOS'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
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

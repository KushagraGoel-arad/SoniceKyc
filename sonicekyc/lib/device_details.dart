
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';

import 'location_details.dart';

class dev_details extends StatefulWidget {
  const dev_details({super.key});

  @override
  State<dev_details> createState() => _dev_detailsState();
}

class _dev_detailsState extends State<dev_details> {
  late bool selectedOption = true;

  String browserName = '';
  String browserVersion = '';

  Future<void> _getDeviceDetails() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
    setState(() {
      browserName = webBrowserInfo.browserName as String;

      browserVersion = webBrowserInfo.platform!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Device Details",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Please allow us to get your device details for",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[500],
                ),
              ),
              Text(
                "verifying unique device for onboarding user",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[500],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                color: Colors.black,
                thickness: 1,
                height: 20,
                indent: 10,
                endIndent: 10,
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  RadioListTile(
                    title: const Text(
                      'For security reasons we need your device details',
                      style: TextStyle(fontSize: 18),
                    ),
                    value: selectedOption,
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        !selectedOption;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 500,
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    backgroundColor: const Color(0xFF2C32BE),
                  ),
                  onPressed: () {
                    _getDeviceDetails;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const location(),
                      ),
                    );
                  },
                  child: const Center(
                      child: Text(
                    "GET DETAILS",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

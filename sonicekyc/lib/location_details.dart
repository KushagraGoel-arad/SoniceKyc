
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sonicekyc/document.dart';

class location extends StatefulWidget {
  const location({super.key});

  @override
  State<location> createState() => _locationState();
}

class _locationState extends State<location> {
  late bool selectedOption = true;

  double latitude = 0.0;
  double longitude = 0.0;

  Future<void> _getLocationDetails() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are disabled.
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Location permissions are denied.
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are permanently denied.
      return;
    }

    // Get the current position.
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.medium,
    );

    setState(() {
      latitude = position.latitude;
      longitude = position.longitude;
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
                "Location Details",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Please allow us to get your device location",
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
                  RadioListTile(
                    title: const Text(
                      'Allowed Countries: India',
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
                    _getLocationDetails;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const docs(),
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

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VPNDetectionScreen extends StatefulWidget {
  const VPNDetectionScreen({super.key});

  @override
  _VPNDetectionScreenState createState() => _VPNDetectionScreenState();
}

class _VPNDetectionScreenState extends State<VPNDetectionScreen> {
  bool _isUsingVPN = false;

  @override
  void initState() {
    super.initState();
    _detectVPN();
  }

  Future<void> _detectVPN() async {
    try {
      // Make an HTTP GET request to ipinfo.io API
      final response = await http.get(Uri.parse('https://ipinfo.io/json'));

      if (response.statusCode == 200) {
        // Parse the response JSON
        final data = json.decode(response.body);

        // Check if the organization field indicates a VPN
        if (data['org'] != null && data['org'].toString().toLowerCase().contains('vpn')) {
          setState(() {
            _isUsingVPN = true;
          });
        }
      } else {
        // Handle error response
        print('Failed to get IP information. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any network or parsing errors
      print('Error detecting VPN: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VPN Detection'),
      ),
      body: Center(
        child: _isUsingVPN
            ? const Text('You are using a VPN.')
            : const Text('You are not using a VPN.'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sonicekyc/APIs/CreateApplication.dart';
import 'package:sonicekyc/reg_code.dart';

class start extends StatefulWidget {
  const start({super.key});

  @override
  State<start> createState() => _startState();
}

class _startState extends State<start> {
  Future<void> _getPolicyDetailsAndToken() async {
    try {
      final result = await CreateApplication();
      final Object? jwtToken = result['jwtToken'];
      final Object? policyDetails = result['policyDetails'];

      // Use the JWT token and policy details as needed
      print('JWT Token: $jwtToken');
      print('Policy Details: $policyDetails');
    } catch (e) {
      print('Error occurred while fetching policy details and token: $e');
    }
  }

  void initState() {
    super.initState();
    _getPolicyDetailsAndToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'images/logo.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "The 'SONIC'",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Text(
              "Onboard",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text("Identity Proofing that is fast, secure, mobile first,",
                style: TextStyle(color: Colors.grey[400], fontSize: 17)),
            Text("on-device plus no online API calls.",
                style: TextStyle(color: Colors.grey[400], fontSize: 17)),
            const SizedBox(
              height: 250,
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  backgroundColor: const Color(0xFF2C32BE),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const reg_code(),
                    ),
                  );
                },
                child: const Center(
                    child: Text(
                  "START",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "By clicking 'START' you consent to Sonic collecting and",
              style: TextStyle(fontSize: 16),
            ),
            const Text("disclosing your biometric data pursuant to its ",
                style: TextStyle(fontSize: 16)),
            const SizedBox(
              height: 10,
            ),
            const Text("Privacy Policy ",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF2C32BE),
                  decoration: TextDecoration.underline,
                )),
          ],
        ),
      ),
    );
  }
}

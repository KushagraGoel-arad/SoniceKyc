import 'package:flutter/material.dart';

class kyc_completed extends StatefulWidget {
  const kyc_completed({super.key});

  @override
  State<kyc_completed> createState() => _kyc_completedState();
}

class _kyc_completedState extends State<kyc_completed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "KYC Completed",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Thanks for your valuable time to complete KYC",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[500],
              ),
            ),
            Text(
              "visit again :-)",
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
            Center(
              child: Image.asset(
                'images/kyc_compl.png',
                fit: BoxFit.cover,
              ),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const kyc_completed(),
                    ),
                  );
                },
                child: const Center(
                    child: Text(
                  "CLOSE",
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
    );
  }
}

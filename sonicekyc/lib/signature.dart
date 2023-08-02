
import 'package:flutter/material.dart';
import 'package:sonicekyc/signatureCapture.dart';
import 'package:sonicekyc/verify_signature.dart';

class signature extends StatefulWidget {
  const signature({super.key});

  @override
  State<signature> createState() => _signatureState();
}

class _signatureState extends State<signature> {
  late bool selectedOption = true;
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
              "Signature",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Give your signature to sonic onboard app",
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
              indent: 20,
              endIndent: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                RadioListTile(
                  title: const Text(
                    'Sign on Paper',
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
                    'Please use plain white paper',
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
                    'Please write in bold capital letters',
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
              height: 400,
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
                      builder: (context) => sigCapture(),
                    ),
                  );
                },
                child: const Center(
                    child: Text(
                  "CLICK SIGNATURE",
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


import 'package:flutter/material.dart';
import 'package:sonicekyc/consent_note_capture.dart';

class consent extends StatefulWidget {
  const consent({super.key});

  @override
  State<consent> createState() => _consentState();
}

class _consentState extends State<consent> {
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
              "Consent Note",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Give your consent to sonic onboard app",
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
                    'Write given consent note on paper',
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
                      builder: (context) => const consent_note(),
                    ),
                  );
                },
                child: const Center(
                    child: Text(
                  "CLICK CONSENT",
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

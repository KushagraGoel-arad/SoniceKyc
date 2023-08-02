import 'package:flutter/material.dart';
import 'package:sonicekyc/magic_capture.dart';
import 'package:sonicekyc/magic_record.dart';

class magic_num extends StatefulWidget {
  const magic_num({super.key});

  @override
  State<magic_num> createState() => _magic_numState();
}

class _magic_numState extends State<magic_num> {
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
              "Speak a magic number",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "For security, we need to get real time magic number",
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
                    'Follow the instructions to speak',
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
                    'Press the record button and say each word out loud',
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
                    'Place your face into circle to visible record button',
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
                      builder: (context) => const magic_rec(),
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
          ],
        ),
      ),
    );
  }
}

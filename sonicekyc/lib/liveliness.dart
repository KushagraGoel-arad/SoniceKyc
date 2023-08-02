
import 'package:flutter/material.dart';
import 'package:sonicekyc/camera_circular.dart';
import 'package:sonicekyc/recordLiveness.dart';

class Strliveliness extends StatefulWidget {
  const Strliveliness({super.key});

  @override
  State<Strliveliness> createState() => _StrlivelinessState();
}

class _StrlivelinessState extends State<Strliveliness> {
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
              "Record a liveness video",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "For security, we need to record your screen",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[500],
              ),
            ),
            Text(
              "when you are doing liveness",
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
                    'Follow the instructions to move',
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
                    'Complete task to get next instruction',
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
              height: 450,
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
                      builder: (context) =>  camera_circular(),
                    ),
                  );
                },
                child: const Center(
                    child: Text(
                  "START LIVENESS",
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

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:sonicekyc/magic_num.dart';

class verify_selfie extends StatefulWidget {
  //const verify_selfie({super.key});
  // final XFile? getPic1;

  // verify_selfie({
  //   Key? key,
  //   this.getPic1,
  // }) : super(key: key);

  @override
  State<verify_selfie> createState() => _verify_selfieState();
}

class _verify_selfieState extends State<verify_selfie> {
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
              "Verify Selfie",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Please verify taken image",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[500],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Container(
                width: 300,
                height: 300,

                // child: Image.network(
                //   widget.getPic1!.path,
                //   fit: BoxFit.cover,
                // ),
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(10),
                //   image: DecorationImage(
                //     image: FileImage(File(imagePath)),
                //     fit: BoxFit.cover,
                //   ),
                // ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Make sure your details are clear and unobstructed ",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 300,
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
                      builder: (context) => const magic_num(),
                    ),
                  );
                },
                child: const Center(
                    child: Text(
                  "SUBMIT PHOTO",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  backgroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const magic_num(),
                    ),
                  );
                },
                child: const Center(
                    child: Text(
                  "RETAKE PHOTO",
                  style: TextStyle(color: Color(0xFF2C32BE), fontSize: 18),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

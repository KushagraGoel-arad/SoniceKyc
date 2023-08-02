
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sonicekyc/camera_circular.dart';
import 'package:sonicekyc/magic_record.dart';

class magic_record extends StatefulWidget {
  const magic_record({super.key});

  @override
  State<magic_record> createState() => _magic_recordState();
}

class _magic_recordState extends State<magic_record> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
         // const camera_circular(),
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FractionallySizedBox(
                    widthFactor: 0.9,
                    child: Container(
                      height: 50,
                      width: 80,
                      color: const Color(0xff302c32be),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              CupertinoIcons.info_circle_fill,
                              color: Color(0xFF2C32BE),
                            ),
                            onPressed: () {},
                          ),
                          const Expanded(
                              child: Text(
                            "No face detected",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Text(
                    //   "4454",
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //     fontSize: 45.0,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                  ],
                ),
                const SizedBox(width: 25.0),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          'Press the record button and say each digit out loud',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(CupertinoIcons.camera_circle ),
                              iconSize: 50,
                              color: Colors.white,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const magic_rec(),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            IconButton(
                                icon: const Icon(CupertinoIcons.camera_rotate),
                                iconSize: 50,
                                color: Colors.white,
                                onPressed: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => report(),
                                  //   ),
                                  // );
                                }),
                          ],
                        )
                      ]))),
        ],
      ),
    );
  }
}

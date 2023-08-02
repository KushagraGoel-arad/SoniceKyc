
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sonicekyc/camera_circular.dart';

class right extends StatefulWidget {
  const right({super.key});

  @override
  State<right> createState() => _rightState();
}

class _rightState extends State<right> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          camera_circular(),

          // Align(
          //   alignment: Alignment.topCenter,
          //   child: Column(
          //     mainAxisSize: MainAxisSize.min,
          //     children: [
          //       const SizedBox(
          //         height: 30,
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: FractionallySizedBox(
          //           widthFactor: 0.9,
          //           child: Container(
          //             height: 50,
          //             width: 80,
          //             color: const Color(0xff302c32be),
          //             child: Row(
          //               children: [
          //                 IconButton(
          //                   icon: const Icon(
          //                     CupertinoIcons.info_circle_fill,
          //                     color: Color(0xFF2C32BE),
          //                   ),
          //                   onPressed: () {},
          //                 ),
          //                 const Expanded(
          //                     child: Text(
          //                   "Look right not detected",
          //                   style: TextStyle(fontSize: 16, color: Colors.white),
          //                 )),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //       const SizedBox(height: 100),
          //       // Row(
          //       //   mainAxisAlignment: MainAxisAlignment.center,
          //       //   children: [
          //       //     Text(
          //       //       "Photo page of Passport",
          //       //       style: TextStyle(color: Colors.white),
          //       //     ),
          //       //   ],
          //       // ),
          //       const SizedBox(width: 25.0),
          //     ],
          //   ),
          // ),

          // Padding(
          //     padding: const EdgeInsets.all(16.0),
          //     child: Align(
          //         alignment: Alignment.bottomCenter,
          //         child: Column(
          //             mainAxisAlignment: MainAxisAlignment.end,
          //             children: [
          //               const Text(
          //                 'Please look right',
          //                 style: TextStyle(
          //                   color: Colors.white,
          //                   fontSize: 24.0,
          //                   fontWeight: FontWeight.bold,
          //                 ),
          //               ),
          //               const SizedBox(
          //                 height: 20,
          //               ),
          //               Row(
          //                 crossAxisAlignment: CrossAxisAlignment.center,
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: [
          //                   IconButton(
          //                     icon: const Icon(CupertinoIcons.camera_circle_fill),
          //                     iconSize: 50,
          //                     color: Colors.white,
          //                     onPressed: () {
          //                       // Navigator.push(
          //                       //   context,
          //                       //   MaterialPageRoute(
          //                       //     builder: (context) => verify_selfie(imagePath: image.path),
          //                       //   ),
          //                       // );
          //                     },
          //                   ),
          //                   const SizedBox(
          //                     width: 10,
          //                   ),
          //                   IconButton(
          //                       icon: const Icon(CupertinoIcons.camera_rotate),
          //                       iconSize: 50,
          //                       color: Colors.white,
          //                       onPressed: () {
          //                         // Navigator.push(
          //                         //   context,
          //                         //   MaterialPageRoute(
          //                         //     builder: (context) => report(),
          //                         //   ),
          //                         // );
          //                       }),
          //                 ],
          //               )
          //             ]))),

          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Container(
          //     color: Colors.black.withOpacity(0.8),
          //     margin: EdgeInsets.only(bottom: 16.0),
          //     child: Column(
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         Text(
          //           'Please look left ',
          //           style: TextStyle(
          //             color: Colors.white,
          //             fontSize: 24.0,
          //           ),
          //         ),
          //         // Row(
          //         //   mainAxisAlignment: MainAxisAlignment.center,
          //         //   crossAxisAlignment: CrossAxisAlignment.center,
          //         //   children: [
          //         //     Column(
          //         //       children: [
          //         //         Text(
          //         //           'Please show your passport',
          //         //           style: TextStyle(
          //         //               color: Colors.white,
          //         //               fontSize: 24.0,
          //         //               fontWeight: FontWeight.bold),
          //         //         ),
          //         //         Text(
          //         //           'document in the frame',
          //         //           style: TextStyle(
          //         //               color: Colors.white,
          //         //               fontSize: 24.0,
          //         //               fontWeight: FontWeight.bold),
          //         //         )
          //         //       ],
          //         //     ),
          //         //   ],
          //         // ),
          //         SizedBox(height: 150.0),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           children: [
          //             IconButton(
          //               icon: Icon(CupertinoIcons.camera_circle),
          //               onPressed: () {
          //                 // Navigator.push(
          //                 //   context,
          //                 //   MaterialPageRoute(
          //                 //     builder: (context) => report(),
          //                 //   ),
          //                 // );
          //               },
          //             ),
          //             SizedBox(width: 16.0),
          //             IconButton(
          //               icon: Icon(CupertinoIcons.camera_rotate),
          //               onPressed: () {
          //                 // Navigator.push(
          //                 //   context,
          //                 //   MaterialPageRoute(
          //                 //     builder: (context) => report(),
          //                 //   ),
          //                 // );
          //               },
          //             ),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // Align(
          //   alignment: Alignment.topCenter,
          //   child: Container(
          //     color: Colors.black.withOpacity(0.8),
          //     margin: EdgeInsets.only(bottom: 50.0),
          //     child: Column(
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         SizedBox(
          //           height: 30,
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: FractionallySizedBox(
          //             widthFactor: 0.9,
          //             child: Container(
          //               height: 50,
          //               width: 80,
          //               color: Color(0xFF302C32BE),
          //               child: Row(
          //                 children: [
          //                   IconButton(
          //                     icon: Icon(
          //                       CupertinoIcons.info_circle_fill,
          //                       color: Color(0xFF2C32BE),
          //                     ),
          //                     onPressed: () {},
          //                   ),
          //                   Expanded(
          //                       child: Text(
          //                     "Look left not detected",
          //                     style:
          //                         TextStyle(fontSize: 16, color: Colors.white),
          //                   )),
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ),
          //         SizedBox(height: 200.0),
          //         // Row(
          //         //   mainAxisAlignment: MainAxisAlignment.center,
          //         //   children: [
          //         //     Text(
          //         //       "Photo page of Passport",
          //         //       style: TextStyle(color: Colors.white),
          //         //     ),
          //         //   ],
          //         // ),
          //         SizedBox(width: 25.0),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

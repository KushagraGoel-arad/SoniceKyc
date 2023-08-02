// import 'package:camera_camera/camera_camera.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:sonicekyc/camera_circular.dart';
// import 'package:sonicekyc/look_right.dart';
// import 'package:sonicekyc/verify_selfie.dart';

// class left extends StatefulWidget {
//   final List<CameraDescription>? cameras;
//   const left({this.cameras, Key? key}) : super(key: key);

//   @override
//   State<left> createState() => _leftState();
// }

// class _leftState extends State<left> {
//   late CameraController _cameraController;
//   XFile? pictureFile;
//   XFile? getPic;
//   bool _isCameraReady = false;
// // late final List<CameraDescription>? cameras;
//   late List<CameraDescription> _cameras;
//   @override
//   void initState() {
//     super.initState();
//     _initializeCamera();
//   }

//   Future<void> _initializeCamera() async {
//     _cameras = await availableCameras();
//     _cameraController = CameraController(
//       _cameras[EnumCameraDescription
//           .front.index], // Select the first available camera
//       ResolutionPreset.high,
//       imageFormatGroup: ImageFormatGroup.yuv420,
//     );

//     await _cameraController.initialize();

//     if (mounted) {
//       setState(() {
//         _isCameraReady = true;
//       });
//     }
//   }
//   // controller = CameraController(
//   //     widget.cameras![0],
//   //     ResolutionPreset.max,
//   //   );
//   //   controller.initialize().then((_) {
//   //     if (!mounted) {
//   //       return;
//   //     }
//   //     setState(() {});
//   //   });

//   @override
//   void dispose() {
//     _cameraController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     if (!_isCameraReady || !_cameraController.value.isInitialized) {
//       return const SizedBox(
//         child: Center(
//           child: CircularProgressIndicator(),
//         ),
//       );
//     }
//     return AspectRatio(
//       aspectRatio: 19 / 39,
//       child: Stack(
//         fit: StackFit.expand,
//         children: [
//           CameraPreview(_cameraController),
//           CameraOverlay(
//             padding: 20,
//             aspectRatio: _cameraController.value.aspectRatio,
//             color: Colors.black.withOpacity(0.8),
//           ),
//           //const camera_circular(),
//           // Align(
//           //   alignment: Alignment.topCenter,
//           //   child: Column(
//           //     mainAxisSize: MainAxisSize.min,
//           //     children: [
//           //       const SizedBox(
//           //         height: 30,
//           //       ),
//           //       Padding(
//           //         padding: const EdgeInsets.all(8.0),
//           //         child: FractionallySizedBox(
//           //           widthFactor: 0.9,
//           //           child: Container(
//           //             height: 50,
//           //             width: 80,
//           //             color: const Color(0xff302c32be),
//           //             child: Row(
//           //               children: [
//           //                 IconButton(
//           //                   icon: const Icon(
//           //                     CupertinoIcons.info_circle_fill,
//           //                     color: Color(0xFF2C32BE),
//           //                   ),
//           //                   onPressed: () {},
//           //                 ),
//           //                 const Expanded(
//           //                     child: Text(
//           //                   "Look left not detected",
//           //                   style: TextStyle(fontSize: 16, color: Colors.white),
//           //                 )),
//           //               ],
//           //             ),
//           //           ),
//           //         ),
//           //       ),
//           //       const SizedBox(height: 100),
//           //       // Row(
//           //       //   mainAxisAlignment: MainAxisAlignment.center,
//           //       //   children: [
//           //       //     Text(
//           //       //       "Photo page of Passport",
//           //       //       style: TextStyle(color: Colors.white),
//           //       //     ),
//           //       //   ],
//           //       // ),
//           //       const SizedBox(width: 25.0),
//           //     ],
//           //   ),
//           // ),
//           if (pictureFile != null)
//             Container(
//               child: Image.network(
//                 pictureFile!.path,
//                 height: 100,
//               ),
//             ),
//           Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         const Text(
//                           'Please look left',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 24.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             IconButton(
//                               icon:
//                                   const Icon(CupertinoIcons.camera_circle_fill),
//                               iconSize: 25,
//                               color: Colors.white,
//                               onPressed: () async {
//                                 pictureFile =
//                                     await _cameraController.takePicture();
//                                 // if (pictureFile != null)
//                                 //   XFile? getPic = pictureFile;

//                                 setState(() {
//                                   // Navigator.push(
//                                   //   context,
//                                   //   MaterialPageRoute(
//                                   //     builder: (context) => verify_selfie(
//                                   //       getPic1: getPic,
//                                   //     ),
//                                   //   ),
//                                   // );
//                                 });
//                               },
//                             ),
//                             // const SizedBox(
//                             //   width: 10,
//                             // ),
//                             // IconButton(
//                             //     icon: const Icon(CupertinoIcons.camera_rotate),
//                             //     iconSize: 25,
//                             //     color: Colors.white,
//                             //     onPressed: () {
//                             //       // Navigator.push(
//                             //       //   context,
//                             //       //   MaterialPageRoute(
//                             //       //     builder: (context) => report(),
//                             //       //   ),
//                             //       // );
//                             //     }),
//                           ],
//                         )
//                       ]))),
//         ],
//       ),
//     );
//   }
// }

// enum EnumCameraDescription { front, back }

// class CameraOverlayPainter extends CustomPainter {
//   final double padding;
//   final double aspectRatio;
//   final Color color;

//   CameraOverlayPainter({
//     required this.padding,
//     required this.aspectRatio,
//     required this.color,
//   });

//   @override
//   void paint(Canvas canvas, Size size) {
//     double parentAspectRatio = size.width / size.height;
//     double circularPadding;

//     if (parentAspectRatio < aspectRatio) {
//       circularPadding = padding;
//     } else {
//       circularPadding = (size.width - size.height * aspectRatio) / 2;
//     }

//     // Draw the circular overlay circle
//     canvas.drawCircle(
//       Offset(size.width / 2, size.height / 2),
//       size.height / 4 - circularPadding * 1.5,
//       Paint()..color = Colors.white,
//     );

//     // Draw the filled overlay outside the circle with opacity (0.8)
//     Path path = Path()
//       ..addRect(Rect.fromLTRB(0, 0, size.width, size.height))
//       ..addOval(Rect.fromLTRB(circularPadding, circularPadding,
//           size.width - circularPadding, size.height - circularPadding));
//     canvas.drawPath(
//       path,
//       Paint()
//         ..color = color.withOpacity(0.8)
//         ..blendMode = BlendMode.srcOut,
//     );
//   }

//   @override
//   bool shouldRepaint(CameraOverlayPainter oldDelegate) {
//     return oldDelegate.color != color;
//   }
// }

// class CameraOverlay extends StatelessWidget {
//   final double padding;
//   final double aspectRatio;
//   final Color color;

//   const CameraOverlay({
//     super.key,
//     required this.padding,
//     required this.aspectRatio,
//     required this.color,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       painter: CameraOverlayPainter(
//         padding: padding,
//         aspectRatio: aspectRatio,
//         color: color,
//       ),
//     );
//   }
// }

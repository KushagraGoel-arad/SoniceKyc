
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'dart:html' as html;
// import 'dart:js' as js;

// import 'package:sonicekyc/camera_circular.dart';
// import 'package:sonicekyc/verify_selfie.dart';

// class name extends StatefulWidget {
//   const name({super.key});

//   @override
//   State<name> createState() => _nameState();
// }

// class _nameState extends State<name> {
// //  List<CameraDescription>? _cameras;
// //   String? _capturedImagePath;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _initializeCamera();
// //   }

// //   Future<void> _initializeCamera() async {
// //     try {
// //       _cameras = await availableCameras();
// //     } catch (e) {
// //       print("Error accessing cameras: $e");
// //     }
// //   }

// //   void _onImageCaptured(String imagePath) {
// //     setState(() {
// //       _capturedImagePath = imagePath;
// //     });
// //   }

// //   void _openCamera() async {
// //     if (_cameras != null && _cameras!.isNotEmpty) {
// //       final imagePath = await Navigator.push(
// //         context,
// //         MaterialPageRoute(
// //           builder: (context) => camera_circular(
// //             camera: _cameras![0], // Use the first camera, you can choose based on your requirement.
// //             onImageCaptured: _onImageCaptured,
// //           ),
// //         ),
// //       );

// //       // The imagePath will be null if the user canceled the capture
// //       if (imagePath != null) {
// //         setState(() {
// //           _capturedImagePath = imagePath;
// //         });

// //         // Navigate to DisplayImageScreen with the captured image path
// //         Navigator.push(
// //           context,
// //           MaterialPageRoute(
// //             builder: (context) => verify_selfie(imagePath: _capturedImagePath!),
// //           ),
// //         );
// //       }
// //     }
// //   }

//   // String? _capturedImagePath;

//   // void _onImageCaptured(String imagePath) {
//   //   setState(() {
//   //     _capturedImagePath = imagePath;
//   //     print(_capturedImagePath);
//   //   });
//   // }

//   // late CameraController _cameraController = _cameraController;

// //   Future<void> captureSelfie() async {
// //     try {
// //       final html.MediaStream? mediaStream = await html
// //           .window.navigator.mediaDevices
// //           ?.getUserMedia({'video': false, 'audio': true});

// //       // Create an HTML video element and set the media stream as its source
// //       final video = html.VideoElement()
// //         ..srcObject = mediaStream
// //         ..autoplay = true;

// //       // Append the video element to the body to show the camera stream
// //       html.document.body?.append(video);

// //       // Wait for the user to take the selfie (e.g., with a button press)
// //       // Then, capture the selfie frame as an image
// //       final imageCapture = html.ImageCapture(mediaStream!.getVideoTracks()[0]);
// //       final imageBlob = await imageCapture.takePhoto();

// //       // Display the captured selfie image
// //       final imageUrl = html.Url.createObjectUrlFromBlob(imageBlob);
// //       final img = html.ImageElement(src: imageUrl);
// //       html.document.body?.append(img);
// //      if(mediaStream!=0){
// // final String imagePath;
// //       //  Navigator.push(
// //       //   context,
// //       //   MaterialPageRoute(
// //       //     builder: (context) => verify_selfie(imagePath: ),
// //       //   ),
// //       // );
// //      }
// //     } catch (e) {
// //       // Handle errors
// //       print('Error accessing camera: $e');
// //     }
// //   }
//   // void _captureImage() async {
//   //   try {
//   //     final image = await _cameraController!.takePicture();

//   //     // Navigate to the next screen with the captured image
//   //     Navigator.push(
//   //       context,
//   //       MaterialPageRoute(
//   //         builder: (context) => verify_selfie(imagePath: image.path),
//   //       ),
//   //     );
//   //   } catch (e) {
//   //     print('Error capturing image: $e');
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       body: Stack(
//         children: [
//           camera_circular(
//             //  onImageCaptured: _onImageCaptured,
//           ),
//           Align(
//             alignment: Alignment.topCenter,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: FractionallySizedBox(
//                     widthFactor: 0.9,
//                     child: Container(
//                       height: 50,
//                       width: 80,
//                       color: const Color(0xff302c32be),
//                       child: Row(
//                         children: [
//                           IconButton(
//                             icon: const Icon(
//                               CupertinoIcons.info_circle_fill,
//                               color: Color(0xFF2C32BE),
//                             ),
//                             onPressed: () {},
//                           ),
//                           const Expanded(
//                               child: Text(
//                             "Place your head inside the circle",
//                             style: TextStyle(fontSize: 16, color: Colors.white),
//                           )),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 100),
//                 // Row(
//                 //   mainAxisAlignment: MainAxisAlignment.center,
//                 //   children: [
//                 //     Text(
//                 //       "Photo page of Passport",
//                 //       style: TextStyle(color: Colors.white),
//                 //     ),
//                 //   ],
//                 // ),
//                 const SizedBox(width: 25.0),
//               ],
//             ),
//           ),
//           Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         const Text(
//                           'Click Selfies',
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
//                           children: [
//                             IconButton(
//                               icon:
//                                   const Icon(CupertinoIcons.camera_circle_fill),
//                               iconSize: 50,
//                               color: Colors.white,
//                               onPressed: ()  {
                               
//                                 // Navigator.push(
//                                 //   context,
//                                 //   MaterialPageRoute(
//                                 //       builder: (context) => verify_selfie(
//                                 //           imagePath: _capturedImagePath!)),
//                                 // );
//                               },
//                             ),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             IconButton(
//                                 icon: const Icon(CupertinoIcons.camera_rotate),
//                                 iconSize: 50,
//                                 color: Colors.white,
//                                 onPressed: () {
//                                   // Navigator.push(
//                                   //   context,
//                                   //   MaterialPageRoute(
//                                   //     builder: (context) => report(),
//                                   //   ),
//                                   // );
//                                 }),
//                           ],
//                         )
//                       ]))),
//         ],
//       ),
//     );
//   }
// }

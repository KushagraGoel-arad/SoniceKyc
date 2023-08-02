
import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sonicekyc/camera_access.dart';
import 'package:sonicekyc/signature.dart';

class consent_note extends StatefulWidget {
  const consent_note({super.key});

  @override
  State<consent_note> createState() => _consent_noteState();
}

class _consent_noteState extends State<consent_note> {
  late CameraController _cameraController = _cameraController;
  late List<CameraDescription> _cameras;
  bool _isCameraReady = false;
  bool isPreview = false;
  XFile? pictureFile;
  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    _cameras = await availableCameras();
    _cameraController = CameraController(
      _cameras[EnumCameraDescription
          .front.index], // Select the first available camera
      ResolutionPreset.high,
      imageFormatGroup: ImageFormatGroup.yuv420,
    );

    await _cameraController.initialize();

    if (mounted) {
      setState(() {
        _isCameraReady = true;
      });
    }
  }

  bool showFirstScreen =
      true; // This boolean variable will control the screen content

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    if (!_isCameraReady) {
      return Container();
    }
    return Scaffold(
      body: buildFirstScreen() 

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Toggle the boolean value to switch between screens
      //     setState(() {
      //       showFirstScreen = !showFirstScreen;
      //     });
      //   },
      //   child: Icon(Icons.swap_horiz),
      // ),
    );
  }
  Widget buildFirstScreen() {
    // Replace this with your first screen content
    return Scaffold(
        //aspectRatio: 19 / 39,
        body: Stack(fit: StackFit.expand, children: [
          CameraPreview(_cameraController),
          cameraOverlay(
            padding: 20,
            aspectRatio: 1,
            color: Colors.black.withOpacity(0.8),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("I'M DOING ONBOARDING SONIC KYC",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 25)),
                ),

                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: FractionallySizedBox(
                //     widthFactor: 0.9,
                //     child: Container(
                //       height: 50,
                //       width: 80,
                //       color: Color(0xFF302C32BE),
                //       child: Row(
                //         children: [
                //           IconButton(
                //             icon: Icon(
                //               CupertinoIcons.info_circle_fill,
                //               color: Color(0xFF2C32BE),
                //             ),
                //             onPressed: () {},
                //           ),
                //           Expanded(
                //               child: Text(
                //             "No face detected",
                //             style: TextStyle(fontSize: 16, color: Colors.white),
                //           )),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(height: 75),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       "4454",
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 45.0,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(width: 25.0),
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
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Please write down given consent note on plain paper and click a photograph',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
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
                              icon: const Icon(CupertinoIcons.camera_circle),
                              iconSize: 50,
                              color: Colors.white,
                              onPressed: () async {
                                pictureFile =
                                    await _cameraController.takePicture();
                                setState(() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => signature(),
                                    ),
                                  );
                                  //isPreview = true;
                                  //showFirstScreen = !showFirstScreen;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            // IconButton(
                            //     icon: Icon(CupertinoIcons.camera_rotate),
                            //     iconSize: 40,
                            //     color: Colors.white,
                            //     onPressed: () {
                            //       // Navigator.push(
                            //       //   context,
                            //       //   MaterialPageRoute(
                            //       //     builder: (context) => report(),
                            //       //   ),
                            //       // );
                            //     }),
                          ],
                        )
                      ]))),
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
          //     padding: const EdgeInsets.all(8.0),
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
          //                     icon:
          //                         const Icon(CupertinoIcons.camera_circle_fill),
          //                     iconSize: 50,
          //                     color: Colors.white,
          //                     onPressed: () async {
          //                       pictureFile =
          //                           await _cameraController.takePicture();
          //                       setState(() {
          //                         isPreview = true;
          //                         showFirstScreen = !showFirstScreen;
          //                       });
          //                     },
          //                   ),
          //                   // const SizedBox(
          //                   //   width: 10,
          //                   // ),
          //                   //                 IconButton(
          //                   //                     icon: const Icon(CupertinoIcons.camera_rotate),
          //                   //                     iconSize: 50,
          //                   //                     color: Colors.white,
          //                   //                     onPressed: () async {
          //                   //   pictureFile = await _cameraController.takePicture();
          //                   //   setState(() {});
          //                   // },),
          //                 ],
          //               )
          //             ]))),
        ]));
  }
// Widget buildSecondScreen() {
//     return Scaffold(
//       body: Stack(
//         children: [
          
//           const Align(
//             alignment: Alignment.topCenter,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(16.0),
//                   child: Text("I'M DOING ONBOARDING SONIC KYC",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(color: Colors.white, fontSize: 25)),
//                 ),

//                 // Padding(
//                 //   padding: const EdgeInsets.all(8.0),
//                 //   child: FractionallySizedBox(
//                 //     widthFactor: 0.9,
//                 //     child: Container(
//                 //       height: 50,
//                 //       width: 80,
//                 //       color: Color(0xFF302C32BE),
//                 //       child: Row(
//                 //         children: [
//                 //           IconButton(
//                 //             icon: Icon(
//                 //               CupertinoIcons.info_circle_fill,
//                 //               color: Color(0xFF2C32BE),
//                 //             ),
//                 //             onPressed: () {},
//                 //           ),
//                 //           Expanded(
//                 //               child: Text(
//                 //             "No face detected",
//                 //             style: TextStyle(fontSize: 16, color: Colors.white),
//                 //           )),
//                 //         ],
//                 //       ),
//                 //     ),
//                 //   ),
//                 // ),
//                 SizedBox(height: 75),
//                 // Row(
//                 //   mainAxisAlignment: MainAxisAlignment.center,
//                 //   children: [
//                 //     Text(
//                 //       "4454",
//                 //       style: TextStyle(
//                 //         color: Colors.white,
//                 //         fontSize: 45.0,
//                 //         fontWeight: FontWeight.bold,
//                 //       ),
//                 //     ),
//                 //   ],
//                 // ),
//                 SizedBox(width: 25.0),
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
//                         const Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Text(
//                             'Please write down given consent note on plain paper and click a photograph',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20.0,
//                               fontWeight: FontWeight.bold,
//                             ),
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
//                               icon: const Icon(CupertinoIcons.camera_circle),
//                               iconSize: 50,
//                               color: Colors.white,
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => const signature(),
//                                   ),
//                                 );
//                               },
//                             ),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             // IconButton(
//                             //     icon: Icon(CupertinoIcons.camera_rotate),
//                             //     iconSize: 40,
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
}




enum EnumCameraDescription { front, back }

Widget cameraOverlay(
    {required double padding,
    required double aspectRatio,
    required Color color}) {
  return LayoutBuilder(builder: (context, constraints) {
    double parentAspectRatio = constraints.maxWidth / constraints.maxHeight;
    double horizontalPadding;
    double verticalPadding;

    if (parentAspectRatio < aspectRatio) {
      horizontalPadding = padding;
      verticalPadding = (constraints.maxHeight -
              ((constraints.maxWidth - 2 * padding) / aspectRatio)) /
          2;
    } else {
      verticalPadding = padding;
      horizontalPadding = (constraints.maxWidth -
              ((constraints.maxHeight - 2 * padding) * aspectRatio)) /
          2;
    }
    return Stack(fit: StackFit.expand, children: [
      Align(
          alignment: Alignment.centerLeft,
          child: Container(width: horizontalPadding, color: color)),
      Align(
          alignment: Alignment.centerRight,
          child: Container(width: horizontalPadding, color: color)),
      Align(
          alignment: Alignment.topCenter,
          child: Container(
              margin: EdgeInsets.only(
                  left: horizontalPadding, right: horizontalPadding),
              height: verticalPadding,
              color: color)),
      Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              margin: EdgeInsets.only(
                  left: horizontalPadding, right: horizontalPadding),
              height: verticalPadding,
              color: color)),
      Container(
        margin: EdgeInsets.symmetric(
            horizontal: horizontalPadding, vertical: verticalPadding),
        decoration: BoxDecoration(border: Border.all(color: Colors.white)),
      )
    ]);
  });
}

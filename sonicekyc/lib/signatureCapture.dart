import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sonicekyc/kyc_completed.dart';
import 'package:sonicekyc/verify_signature.dart';

class sigCapture extends StatefulWidget {
  const sigCapture({super.key});

  @override
  State<sigCapture> createState() => _sigCaptureState();
}

class _sigCaptureState extends State<sigCapture> {
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
      body: showFirstScreen ? buildFirstScreen() : buildSecondScreen(),

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
              child: Text("CAPTURE SIGNATURE",
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
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Please write down your SIGNATURE on plain paper and click a photograph',
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
                        pictureFile = await _cameraController.takePicture();
                        setState(() {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => verify_signature(),
                          //   ),
                          // );
                          isPreview = true;
                          showFirstScreen = !showFirstScreen;
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

  Widget buildSecondScreen() {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Verify Signature",
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

                child: Image.network(
                  pictureFile!.path,
                  fit: BoxFit.cover,
                ),
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
            const Text(
              "   Make sure your details are clear and unobstructed ",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 200,
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
                      builder: (context) => const kyc_completed(),
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
                  setState(() {
                    showFirstScreen = !showFirstScreen;
                  });
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => verify_doc(),
                  //   ),
                  // );
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

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter/material.dart';
import 'package:camera_camera/camera_camera.dart';
import 'package:sonicekyc/magic_num.dart';

class camera_circular extends StatefulWidget {
  //const camera_circular({super.key});

  // final String imagePath;

  // camera_circular({required this.imagePath});

  // final Function(String) onImageCaptured;

  // camera_circular({super.key, required this.onImageCaptured});

  @override
  State<camera_circular> createState() => _camera_circularState();
}

class _camera_circularState extends State<camera_circular> {
  late CameraController _cameraController = _cameraController;
  late List<CameraDescription> _cameras;
  bool _isCameraReady = false;
  bool selr=false;
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
          CameraOverlay(
            padding: 20,
            aspectRatio: _cameraController.value.aspectRatio,
            color: Colors.black.withOpacity(0.8),
          ),
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
                            "Face not detected",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 100),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       "Photo page of Passport",
                //       style: TextStyle(color: Colors.white),
                //     ),
                //   ],
                // ),
                const SizedBox(width: 25.0),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text('Please look into the circle',
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
                              icon:
                                  const Icon(CupertinoIcons.camera_circle_fill),
                              iconSize: 50,
                              color: Colors.white,
                              onPressed: () async {
                                pictureFile =
                                    await _cameraController.takePicture();
                                setState(() {
                                  isPreview = true;
                                  showFirstScreen = !showFirstScreen;
                                });
                              },
                            ),
                            // const SizedBox(
                            //   width: 10,
                            // ),
                            //                 IconButton(
                            //                     icon: const Icon(CupertinoIcons.camera_rotate),
                            //                     iconSize: 50,
                            //                     color: Colors.white,
                            //                     onPressed: () async {
                            //   pictureFile = await _cameraController.takePicture();
                            //   setState(() {});
                            // },),
                          ],
                        )
                      ]))),
        ]));
  }

  Widget buildSecondScreen() {
    // Replace this with your second screen content
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
                  setState(() {
                    showFirstScreen = !showFirstScreen;
                  });
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const buildFirstScreen(),
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

class CameraOverlayPainter extends CustomPainter {
  final double padding;
  final double aspectRatio;
  final Color color;

  CameraOverlayPainter({
    required this.padding,
    required this.aspectRatio,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double parentAspectRatio = size.width / size.height;
    double circularPadding;

    if (parentAspectRatio < aspectRatio) {
      circularPadding = padding;
    } else {
      circularPadding = (size.width - size.height * aspectRatio) / 2;
    }

    // Draw the circular overlay circle
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.height / 4 - circularPadding * 1.5,
      Paint()..color = Colors.white,
    );

    // Draw the filled overlay outside the circle with opacity (0.8)
    Path path = Path()
      ..addRect(Rect.fromLTRB(0, 0, size.width, size.height))
      ..addOval(Rect.fromLTRB(circularPadding, circularPadding,
          size.width - circularPadding, size.height - circularPadding));
    canvas.drawPath(
      path,
      Paint()
        ..color = color.withOpacity(0.8)
        ..blendMode = BlendMode.srcOut,
    );
  }

  @override
  bool shouldRepaint(CameraOverlayPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

class CameraOverlay extends StatelessWidget {
  final double padding;
  final double aspectRatio;
  final Color color;

  const CameraOverlay({
    super.key,
    required this.padding,
    required this.aspectRatio,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CameraOverlayPainter(
        padding: padding,
        aspectRatio: aspectRatio,
        color: color,
      ),
    );
  }
}

// Widget cameraOverlay({
//   required double padding,
//   required double aspectRatio,
//   required Color color,
// }) {
//   return LayoutBuilder(builder: (context, constraints) {
//     double parentAspectRatio = constraints.maxWidth / constraints.maxHeight;
//     double circularPadding;

//     if (parentAspectRatio < aspectRatio) {
//       circularPadding = padding;
//     } else {
//       circularPadding = (constraints.maxWidth - constraints.maxHeight * aspectRatio) / 2;
//     }

//     return Stack(
//       fit: StackFit.expand,
//       children: [
//         Positioned(
//           left: circularPadding,
//           top: 0,
//           right: circularPadding,
//           bottom: 0,
//           child: Container(
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(color: Colors.white),
//             ),
//           ),
//         ),
//       ],
//     );
//   });
// }

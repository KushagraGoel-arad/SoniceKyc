import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:sonicekyc/camera_circular.dart';
import 'package:sonicekyc/consent.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class magic_rec extends StatefulWidget {
  const magic_rec({super.key});

  @override
  State<magic_rec> createState() => _magic_recState();
}

class _magic_recState extends State<magic_rec> {
  late stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;

  String _text = '';
  double _confidence = 1.0;

  late CameraController _cameraController = _cameraController;
  late List<CameraDescription> _cameras;
  bool _isCameraReady = false;
  bool isPreview = false;
  XFile? pictureFile;
  // String _lastWords = '';
  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
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

  bool showFirstScreen = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    if (!_isCameraReady) {
      return Container();
    }
    return Scaffold(body: buildFirstScreen()

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
      // aspectRatio: 19 / 39,
      body: Stack(
        fit: StackFit.expand,
        children: [
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
                const SizedBox(height: 75),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _speech.isListening
                            ? ' $_text'
                            : _isListening
                                ? 'Speech not available'
                                : 'Press the record button\n& say each digit out loud',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 25.0),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: _isListening,
        glowColor: Theme.of(context).primaryColor,
        endRadius: 75.0,
        duration: const Duration(milliseconds: 2000),
        repeatPauseDuration: const Duration(milliseconds: 100),
        repeat: true,
        child: FloatingActionButton(
          onPressed: _listen,
          child: Icon(_isListening ? Icons.mic : Icons.mic_none),
        ),
      ),
    );
  }

  // Widget buildSecondScreen() {
  //   // Replace this with your second screen content
  //   return Scaffold(
  //     body: Padding(
  //       padding: const EdgeInsets.all(15.0),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           const Text(
  //             "Verify Selfie",
  //             style: TextStyle(
  //               fontSize: 40,
  //               fontWeight: FontWeight.w600,
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 10,
  //           ),
  //           Text(
  //             "Please verify taken image",
  //             style: TextStyle(
  //               fontSize: 16,
  //               color: Colors.grey[500],
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 50,
  //           ),
  //           Center(
  //             child: Container(
  //               width: 300,
  //               height: 300,

  //               child: Image.network(
  //                 pictureFile!.path,
  //                 fit: BoxFit.cover,
  //               ),
  //               // decoration: BoxDecoration(
  //               //   borderRadius: BorderRadius.circular(10),
  //               //   image: DecorationImage(
  //               //     image: FileImage(File(imagePath)),
  //               //     fit: BoxFit.cover,
  //               //   ),
  //               // ),
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 25,
  //           ),
  //           const Row(
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: [
  //               Text(
  //                 "Make sure your details are clear and unobstructed ",
  //                 style: TextStyle(
  //                   fontSize: 16,
  //                   color: Colors.black,
  //                 ),
  //               ),
  //             ],
  //           ),
  //           const SizedBox(
  //             height: 200,
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.all(14.0),
  //             child: ElevatedButton(
  //               style: ElevatedButton.styleFrom(
  //                 padding:
  //                     const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
  //                 shape: const RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.all(Radius.circular(5))),
  //                 backgroundColor: const Color(0xFF2C32BE),
  //               ),
  //               onPressed: () {
  //                 Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                     builder: (context) => const magic_(),
  //                   ),
  //                 );
  //               },
  //               child: const Center(
  //                   child: Text(
  //                 "SUBMIT PHOTO",
  //                 style: TextStyle(color: Colors.white, fontSize: 18),
  //               )),
  //             ),
  //           ),
  //           const SizedBox(
  //             height: 15,
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.all(14.0),
  //             child: ElevatedButton(
  //               style: ElevatedButton.styleFrom(
  //                 padding:
  //                     const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
  //                 shape: const RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.all(Radius.circular(5)),
  //                 ),
  //                 backgroundColor: Colors.white,
  //               ),
  //               onPressed: () {
  //                 setState(() {
  //                   showFirstScreen = !showFirstScreen;
  //                 });
  //                 // Navigator.push(
  //                 //   context,
  //                 //   MaterialPageRoute(
  //                 //     builder: (context) => const buildFirstScreen(),
  //                 //   ),
  //                 // );
  //               },
  //               child: const Center(
  //                   child: Text(
  //                 "RETAKE PHOTO",
  //                 style: TextStyle(color: Color(0xFF2C32BE), fontSize: 18),
  //               )),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  //   return Scaffold(
  //     body: Stack(
  //       children: [
  //         //const camera_circular(),
  //         Align(
  //           alignment: Alignment.topCenter,
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               const SizedBox(
  //                 height: 30,
  //               ),
  //               // Padding(
  //               //   padding: const EdgeInsets.all(8.0),
  //               //   child: FractionallySizedBox(
  //               //     widthFactor: 0.9,
  //               //     child: Container(
  //               //       height: 50,
  //               //       width: 80,
  //               //       color: Color(0xFF302C32BE),
  //               //       child: Row(
  //               //         children: [
  //               //           IconButton(
  //               //             icon: Icon(
  //               //               CupertinoIcons.info_circle_fill,
  //               //               color: Color(0xFF2C32BE),
  //               //             ),
  //               //             onPressed: () {},
  //               //           ),
  //               //           Expanded(
  //               //               child: Text(
  //               //             "No face detected",
  //               //             style: TextStyle(fontSize: 16, color: Colors.white),
  //               //           )),
  //               //         ],
  //               //       ),
  //               //     ),
  //               //   ),
  //               // ),
  //               const SizedBox(height: 75),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Padding(
  //                     padding: const EdgeInsets.all(8.0),
  //                     child: Text(
  //                       _speech.isListening
  //                           ? ' $_text'
  //                           : _isListening
  //                               ? 'Speech not available'
  //                               : 'Press the record button\n& say each digit out loud',
  //                       style: const TextStyle(
  //                         color: Colors.white,
  //                         fontSize: 30.0,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               const SizedBox(width: 25.0),
  //             ],
  //           ),
  //         ),
  //         // Padding(
  //         //     padding: const EdgeInsets.all(16.0),
  //         //     child: Align(
  //         //         alignment: Alignment.bottomCenter,
  //         //         child: Column(
  //         //             mainAxisAlignment: MainAxisAlignment.start,
  //         //             children: [
  //         //               Text(
  //         //                 'Press the record button and say each digit out loud',
  //         //                 style: TextStyle(
  //         //                   color: Colors.white,
  //         //                   fontSize: 24.0,
  //         //                   fontWeight: FontWeight.bold,
  //         //                 ),
  //         //               ),
  //         //               SizedBox(
  //         //                 height: 20,
  //         //               ),
  //         //               // Row(
  //         //               //   crossAxisAlignment: CrossAxisAlignment.center,
  //         //               //   mainAxisAlignment: MainAxisAlignment.center,
  //         //               //   children: [

  //         //               //     // IconButton(
  //         //               //     //   icon: Icon(CupertinoIcons.camera_circle ),
  //         //               //     //   iconSize: 50,
  //         //               //     //   color: Colors.white,
  //         //               //     //   onPressed: () {
  //         //               //     //     Navigator.push(
  //         //               //     //       context,
  //         //               //     //       MaterialPageRoute(
  //         //               //     //         builder: (context) => magic_denied(),
  //         //               //     //       ),
  //         //               //     //     );
  //         //               //     //   },
  //         //               //     // ),
  //         //               //     // SizedBox(
  //         //               //     //   width: 10,
  //         //               //     // ),
  //         //               //     // IconButton(
  //         //               //     //     icon: Icon(CupertinoIcons.camera_rotate),
  //         //               //     //     iconSize: 50,
  //         //               //     //     color: Colors.white,
  //         //               //     //     onPressed: () {
  //         //               //     //       // Navigator.push(
  //         //               //     //       //   context,
  //         //               //     //       //   MaterialPageRoute(
  //         //               //     //       //     builder: (context) => report(),
  //         //               //     //       //   ),
  //         //               //     //       // );
  //         //               //     //     }),
  //         //               //   ],
  //         //               // )
  //         //             ]))),
  //       ],
  //     ),
  //     floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
  //     floatingActionButton: AvatarGlow(
  //       animate: _isListening,
  //       glowColor: Theme.of(context).primaryColor,
  //       endRadius: 75.0,
  //       duration: const Duration(milliseconds: 2000),
  //       repeatPauseDuration: const Duration(milliseconds: 100),
  //       repeat: true,
  //       child: FloatingActionButton(
  //         onPressed: _listen,
  //         child: Icon(_isListening ? Icons.mic : Icons.mic_none),
  //       ),
  //     ),
  //   );
  // }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
              Future.delayed(const Duration(seconds: 5), () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const consent(),
                  ),
                );
              });
            }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
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

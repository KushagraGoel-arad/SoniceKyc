import 'package:flutter/material.dart';
import 'package:sonicekyc/camera_access.dart';
import 'package:sonicekyc/look_left.dart';
import 'package:sonicekyc/look_right.dart';
import 'package:sonicekyc/recordLiveness.dart';
import 'package:sonicekyc/start.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: start(),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tflite_web/tflite_web.dart';

class MyMLScreen extends StatefulWidget {
  const MyMLScreen({super.key});

  @override
  _MyMLScreenState createState() => _MyMLScreenState();
}

class _MyMLScreenState extends State<MyMLScreen> {
  TFLiteModel? _tfLieModel;
  String? _modelOutput;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 10), () {
      TFLiteWeb.initialize().then((value) async {
        _tfLieModel = await TFLiteModel.fromUrl(
          '/models/face_detection.tflite',
        );
        setState(() {});
      }).catchError((e) {
        print(e);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            OutlinedButton(
              onPressed: _tfLieModel == null ? null : _runModel,
              child: const Text('Run Model'),
            ),
            const SizedBox(height: 16),
            if (_modelOutput != null) Text(_modelOutput!),
          ],
        ),
      ),
    );
  }

  void _runModel() async {
    final tensor = createTensor(
      Float32List(128 * 128 * 3),
      shape: [1, 128, 128, 3],
      type: TFLiteDataType.float32,
    );

    final result = _tfLieModel!.predict<NamedTensorMap>(tensor);
    print((result['regressors'] as Tensor).size);
  }
}
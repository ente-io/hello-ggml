import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

import 'package:hello_ggml/hello_ggml.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String response;
  late Future<int> sumAsyncResult;

  Future<String> getAccessiblePathForAsset(
      String assetPath, String tempName) async {
    final byteData = await rootBundle.load(assetPath);
    final tempDir = await getTemporaryDirectory();
    final file = await File('${tempDir.path}/$tempName')
        .writeAsBytes(byteData.buffer.asUint8List());
    return file.path;
  }

  @override
  void initState() {
    super.initState();

    response = "wtf";
    Future.delayed(Duration(seconds: 10), () async {
      await loadAndRunModel();
      setState(() {});
    });
  }

  Future<void> loadAndRunModel() async {
    try {
      const modelPath =
          "assets/models/clip-vit-base-patch32_ggml-vision-model-f16.gguf";

      final path = await getAccessiblePathForAsset(modelPath, "model.bin");
      response = GGML.testGgmlInit(path);
    } catch (e) {
      debugPrint("error" + e.toString());
    }
    // LOAD MODEL HERE
  }

  void loadModel() {}

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 25);
    const spacerSmall = SizedBox(height: 10);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Native Packages'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Text(
                  'This calls a native function through FFI that is shipped as source in the package. '
                  'The native code is built as part of the Flutter Runner build.',
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
                spacerSmall,
                Text(
                  'testGgmlInit("hello") = $response',
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

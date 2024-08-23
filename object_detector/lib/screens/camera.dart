import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CameraScreenState();
  }
}

class _CameraScreenState extends State<CameraScreen> {
  late List<CameraDescription> cameras;
  CameraController? cameraController;

  @override
  void initState() {
    super.initState();
    startCamera();
  }

  void startCamera() async {
    cameras = await availableCameras();
    cameraController = CameraController(
      cameras[0],
      ResolutionPreset.high,
      enableAudio: false,
    );
    await cameraController!.initialize().then(
      (value) {
        if (!mounted) {
          return;
        }
        setState(() {});
      },
    ).catchError(
      (e) {
        print(e);
      },
    );
  }

  Future<void> takePicture() async {
    if (!cameraController!.value.isInitialized) {
      return;
    }
    if (cameraController!.value.isTakingPicture) {
      return;
    }
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath =
          '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
      final XFile file = await cameraController!.takePicture();
      final File newImage = await File(file.path).copy(filePath);
      Navigator.pop(context, newImage.path);
    } catch (e) {
      print('Error capturing picture: $e');
    }
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (cameraController?.value.isInitialized ?? false) {
      return Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: CameraPreview(cameraController!),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FloatingActionButton(
                  onPressed: takePicture,
                  child: const Icon(Icons.camera),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}


//RENDERED USELESS AS OF NOW USING IMAGE PICKER
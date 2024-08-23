// import 'package:flutter/material.dart';
// import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';

// void imageDetector(String? inputImagePath) async {
//   print("Inside Image Detector");
//   if (inputImagePath == null) {
//     print('No image path provided');
//     return;
//   }

//   final inputImage = InputImage.fromFilePath(inputImagePath);

//   final mode = DetectionMode.single;

//   // Options to configure the detector while using with base model.
//   final options = ObjectDetectorOptions(
//     mode: mode,
//     classifyObjects: true,
//     multipleObjects: true,
//   );

//   final objectDetector = ObjectDetector(options: options);

//   try {
//     final List<DetectedObject> objects =
//         await objectDetector.processImage(inputImage);

//     for (DetectedObject detectedObject in objects) {
//       final rect = detectedObject.boundingBox;
//       final trackingId = detectedObject.trackingId;

//       for (Label label in detectedObject.labels) {
//         print("Inside For loop");
//         print('${label.text} ${label.confidence}');
//       }
//     }
//   } catch (e) {
//     print('Error detecting objects: $e');
//   }
//   objectDetector.close();
// }
// import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';

// void imageDetector(String? inputImagePath) async {
//   print("Inside Image Detector");
//   if (inputImagePath == null) {
//     print('No image path provided');
//     return;
//   }

//   final inputImage = InputImage.fromFilePath(inputImagePath);

//   final mode = DetectionMode.single;

//   // Options to configure the detector while using with base model.
//   final options = ObjectDetectorOptions(
//     mode: mode,
//     classifyObjects: true,
//     multipleObjects: true,
//   );

//   final objectDetector = ObjectDetector(options: options);

//   try {
//     final List<DetectedObject> objects =
//         await objectDetector.processImage(inputImage);

//     for (DetectedObject detectedObject in objects) {
//       final rect = detectedObject.boundingBox;
//       final trackingId = detectedObject.trackingId;
//       print("Detected object at: $rect with tracking ID: $trackingId");

//       for (Label label in detectedObject.labels) {
//         print("Detected label: ${label.text}, confidence: ${label.confidence}");
//       }
//     }
//   } catch (e) {
//     print('Error detecting objects: $e');
//   } finally {
//     objectDetector.close();
//   }
// }
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';

void imageDetector(String? inputImagePath) async {
  print("Inside Image Detector");
  if (inputImagePath == null) {
    print('No image path provided');
    return;
  }

  final inputImage = InputImage.fromFilePath(inputImagePath);

  final mode = DetectionMode.single;

  // Options to configure the detector while using with base model.
  final options = ObjectDetectorOptions(
    mode: mode,
    classifyObjects: true,
    multipleObjects: true,
  );

  final objectDetector = ObjectDetector(options: options);

  try {
    final List<DetectedObject> objects =
        await objectDetector.processImage(inputImage);

    if (objects.isEmpty) {
      print("No objects detected.");
    }

    for (DetectedObject detectedObject in objects) {
      final rect = detectedObject.boundingBox;
      final trackingId = detectedObject.trackingId;
      print("Detected object at: $rect with tracking ID: $trackingId");

      if (detectedObject.labels.isEmpty) {
        print("No labels found for this object.");
      }

      for (Label label in detectedObject.labels) {
        print("Detected label: ${label.text}, confidence: ${label.confidence}");
      }
    }
  } catch (e) {
    print('Error detecting objects: $e');
  } finally {
    objectDetector.close();
  }
}

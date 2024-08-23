import 'dart:async';
import 'package:flutter/material.dart';
import 'package:object_detector/components/detector/image_detector.dart';
import 'package:object_detector/components/floating_search_bar.dart';
import 'package:object_detector/constants/colors.dart';
import 'package:object_detector/constants/fonts.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:object_detector/screens/camera.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  String? _imagePath;
  void removeImage() {
    setState(() {
      _imagePath = null;
    });
  }
  // File? _selectedImage;

  Future<void> pickImagefromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) {
      return;
    }
    setState(() {
      _imagePath = pickedImage.path;
    });
  }

  // Future pickImagefromCamera() async {
  //   final pickedImage =
  //       await ImagePicker().pickImage(source: ImageSource.camera);
  //   if (pickedImage == null) {
  //     return;
  //   }
  //   setState(() {
  //     _selectedImage = File(pickedImage!.path);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text("Object Detector"),
        titleTextStyle: appbarText,
      ),
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      body: Column(
        children: [
          // const floatingSearchBar(),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: _imagePath == null
                    ? lightmode_searchbar_color
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              height: _imagePath == null ? 300 : 600, // Adjust height as needed
              width: _imagePath == null ? 300 : 600,
              // child: _selectedImage != null
              //     ? Image.file(_selectedImage!)
              //     : const Text("Please Select an Image")),
              child: _imagePath == null
                  ? const Center(child: Text("No image captured"))
                  : Image.file(
                      File(_imagePath!),
                    ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _imagePath == null
                ? FloatingActionButton(
                    onPressed: () async {
                      // Implement action for the first button
                      // print("Check1");
                      // Camera();
                      // print("Check3");
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CameraScreen()),
                      );
                      if (result != null) {
                        setState(() {
                          _imagePath = result;
                        });
                      }
                      // pickImagefromCamera();
                    },
                    tooltip: 'Image from Camera',
                    backgroundColor: lightmode_searchbar_color,
                    foregroundColor: lightmode_icon_color,
                    child: const Icon(Icons.camera),
                  )
                : ElevatedButton.icon(
                    icon: Icon(Icons.delete_rounded),
                    onPressed: removeImage,
                    label: Text("Remove Image"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: lightmode_searchbar_color,
                      foregroundColor: lightmode_icon_color,
                    ),
                  ),
            const Spacer(),
            _imagePath != null
                ? ElevatedButton.icon(
                    icon: Image.asset(
                      "assets/images/logo.png",
                      scale: 6,
                    ),
                    onPressed: () {
                      print(_imagePath);
                      imageDetector(_imagePath);
                    },
                    label: Text("Image Detector"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: lightmode_searchbar_color,
                      foregroundColor: lightmode_icon_color,
                    ),
                  )
                : FloatingActionButton(
                    onPressed: pickImagefromGallery,
                    // onPressed: pickImagefromGallery,
                    tooltip: 'Image from Gallery',
                    backgroundColor: lightmode_searchbar_color,
                    foregroundColor: lightmode_icon_color,
                    child: const Icon(Icons.add_a_photo),
                  ),
          ],
        ),
      ),
      // floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.end,
      //   children: [
      //     FloatingActionButton(
      //       onPressed: () async {
      //         // Implement action for the first button
      //         // print("Check1");
      //         // Camera();
      //         // print("Check3");
      //         final result = await Navigator.push(
      //           context,
      //           MaterialPageRoute(builder: (context) => CameraScreen()),
      //         );
      //         if (result != null) {
      //           setState(() {
      //             _imagePath = result;
      //           });
      //         }
      //       },
      //       tooltip: 'First Button',
      //       backgroundColor: lightmode_searchbar_color,
      //       foregroundColor: lightmode_icon_color,
      //       child: const Icon(Icons.camera),
      //     ),
      //     // Adjust spacing between buttons if needed
      //     SizedBox(
      //       width: MediaQuery.of(context).size.width / 2,
      //     ),
      // FloatingActionButton(
      //   onPressed: () {},
      //   tooltip: 'Second Button',
      //   backgroundColor: lightmode_searchbar_color,
      //   foregroundColor: lightmode_icon_color,
      //   child: const Icon(Icons.add_a_photo),
      // ),
      //   ],
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

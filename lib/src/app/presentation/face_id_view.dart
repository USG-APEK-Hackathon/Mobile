import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class FaceIdView extends StatefulWidget {
  const FaceIdView({super.key});

  @override
  State<FaceIdView> createState() => _FaceIdViewState();
}

class _FaceIdViewState extends State<FaceIdView> {
  File? _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Face Recognition'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: SvgPicture.asset(
              'assets/logo_c_en.svg',
              width: 80,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                //Take image from camera
                final image =
                    await ImagePicker().pickImage(source: ImageSource.camera);

                //Send image to server for face recognition
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                elevation: MaterialStateProperty.all<double>(2),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                maximumSize:
                    MaterialStateProperty.all<Size>(const Size(140, 50)),
                minimumSize:
                    MaterialStateProperty.all<Size>(const Size(140, 50)),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.face_retouching_natural,
                    size: 45,
                  ),
                  Icon(
                    Icons.camera_alt,
                    size: 45,
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: ElevatedButton(
              onPressed: () {
                context.router.pop();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                elevation: MaterialStateProperty.all<double>(2),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                maximumSize:
                    MaterialStateProperty.all<Size>(const Size(140, 50)),
                minimumSize:
                    MaterialStateProperty.all<Size>(const Size(140, 50)),
              ),
              child: const Text("Next"),
            ),
          ),
        ],
      ),
    );
  }
}

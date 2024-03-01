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
  bool _termsAndConditions = false;
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
                final image = await ImagePicker().pickImage(
                  source: ImageSource.camera,
                );

                if (image != null) {
                  setState(() {
                    _image = File(image.path);
                  });
                }

                //Send image to server for face recognition
              },
              style: ButtonStyle(
                backgroundColor: _image != null
                    ? MaterialStateProperty.all<Color>(Colors.green)
                    : MaterialStateProperty.all<Color>(Colors.white),
                elevation: MaterialStateProperty.all<double>(2),
                foregroundColor: _image != null
                    ? MaterialStateProperty.all<Color>(Colors.white)
                    : MaterialStateProperty.all<Color>(Colors.black),
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
          //Checkbox for terms and conditions
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: _termsAndConditions,
                onChanged: (value) {
                  setState(() {
                    _termsAndConditions = value!;
                  });
                },
              ),
              RichText(
                text: const TextSpan(
                  text: 'I agree to the ',
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Terms and Conditions',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40, left: 20, right: 20),
            child: ElevatedButton(
              onPressed: () {
                context.router.pop();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                elevation: MaterialStateProperty.all<double>(2),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                maximumSize: MaterialStateProperty.all<Size>(
                    Size(MediaQuery.of(context).size.width, 50)),
                minimumSize: MaterialStateProperty.all<Size>(
                  Size(MediaQuery.of(context).size.width, 50),
                ),
              ),
              child: const Text("Next"),
            ),
          ),
        ],
      ),
    );
  }
}

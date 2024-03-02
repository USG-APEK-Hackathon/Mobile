// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:apex_mobile/src/config/client/client.dart';
import 'package:apex_mobile/src/config/router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
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
      backgroundColor: const Color(0xFF022964),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () {
            context.router.pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Face Verification",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 10.0,
                right: 30,
              ),
              child: Text(
                "Proof of identity is required to continue. Please take a picture of your face.",
                style:
                    TextStyle(fontSize: 18, color: Colors.white, height: 1.1),
              ),
            ),
            const Spacer(),
            Center(
              child: _image != null
                  ? CircleAvatar(
                      radius: 100,
                      backgroundImage: FileImage(_image!),
                    )
                  : SvgPicture.asset(
                      'assets/face.svg',
                      width: 200,
                      color: Colors.white,
                    ),
            ),
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: _image != null
                      ? MaterialStateProperty.all<Color>(Colors.green)
                      : MaterialStateProperty.all<Color>(Colors.white),
                  elevation: MaterialStateProperty.all<double>(2),
                  foregroundColor: _image != null
                      ? MaterialStateProperty.all<Color>(Colors.white)
                      : MaterialStateProperty.all<Color>(Colors.black),
                  maximumSize: MaterialStateProperty.all<Size>(
                    const Size(140, 50),
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(
                    const Size(140, 50),
                  ),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
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
                child: const Text("Take a picture"),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: _termsAndConditions,
                  overlayColor: MaterialStateProperty.all<Color>(Colors.white),
                  checkColor: const Color(0xFF022964),
                  fillColor: _termsAndConditions
                      ? MaterialStateProperty.all<Color>(Colors.white)
                      : MaterialStateProperty.all<Color>(Colors.transparent),
                  side: const BorderSide(
                    color: Colors.white,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _termsAndConditions = value!;
                    });
                  },
                ),
                RichText(
                  text: const TextSpan(
                    text: 'I agree to the ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: 'Terms and Conditions',
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 40, left: 20, right: 20, top: 10),
              child: ElevatedButton(
                onPressed: () async {
                  if (_termsAndConditions) {
                    // final client = DioClient();
                    // final formData = FormData.fromMap({
                    //   'image': await MultipartFile.fromFile(
                    //     _image!.path,
                    //     filename: 'face.jpg',
                    //   ),
                    // });

                    // await client.uploadImageWithFormData(
                    //   '/first-step/',
                    //   formData,
                    // );
                    // if (mounted)
                      context.router.push(
                        const MainRoute(),
                      );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:
                            Text("Please agree to the terms and conditions"),
                      ),
                    );
                  }
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  elevation: MaterialStateProperty.all<double>(2),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
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
      ),
    );
  }
}

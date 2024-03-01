import 'package:apex_mobile/src/app/data/google_repository.dart';
import 'package:apex_mobile/src/app/presentation/face_id_view.dart';
import 'package:apex_mobile/src/config/router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class SignInView extends StatefulWidget {
  ///
  const SignInView({super.key});

  @override
  State createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Sign In'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/logo_c_en.svg',
            width: 220,
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                GoogleService.instance.signIn().then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Logged in"),
                  ));
                }).catchError((e) async {
                  await context.router.push(const FaceIdRoute());
                  if (!mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Logged in"),
                  ));
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                elevation: MaterialStateProperty.all<double>(2),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                maximumSize:
                    MaterialStateProperty.all<Size>(const Size(300, 50)),
                minimumSize:
                    MaterialStateProperty.all<Size>(const Size(300, 50)),
              ),
              child: const Text("Login with Google"),
            ),
          ),
        ],
      ),
    );
  }
}

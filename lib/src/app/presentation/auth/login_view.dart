import 'package:apex_mobile/src/app/data/google_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

const List<String> scopes = <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly',
];

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: scopes,
);
// #enddocregion Initialize

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
          Center(
            child: ElevatedButton(
              onPressed: () {
                GoogleService.instance.signIn().then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Logged in"),
                  ));
                }).catchError((e) {
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

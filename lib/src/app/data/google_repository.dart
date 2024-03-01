import 'package:google_sign_in/google_sign_in.dart';

class GoogleService {
  GoogleService._();

  static final GoogleService instance = GoogleService._();

  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  Future<void> signIn() async {
    await _googleSignIn.signIn();
  }
}
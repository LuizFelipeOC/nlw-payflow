import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflow/shared/auth/auth.dart';
import 'package:payflow/shared/model/auth_model.dart';

class AuthController {
  final auth = Auth();

  Future<void> inSignIn(BuildContext cnx) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    try {
      final response = await _googleSignIn.signIn();
      final user =
          UserModel(name: response!.displayName!, photoURL: response.photoUrl);
      auth.setUser(cnx, user);
    } catch (error) {
      auth.setUser(cnx, null);
    }
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:payflow/app_widget.dart';

void main() {
  runApp(FirebaseConfig());
}

class FirebaseConfig extends StatefulWidget {
  const FirebaseConfig({Key? key}) : super(key: key);

  @override
  State<FirebaseConfig> createState() => _FirebaseConfigState();
}

class _FirebaseConfigState extends State<FirebaseConfig> {
  final Future<FirebaseApp> _initial = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: _initial,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Material(
            child: Center(
              child: Text(
                'Não foi possivel inciar o firebase!',
                textDirection: TextDirection.ltr,
              ),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.none) {
          return MyApp();
        } else {
          return Material(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

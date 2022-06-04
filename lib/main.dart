import 'package:croppredict/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(cropPredict());
}

class cropPredict extends StatefulWidget {
  cropPredict({Key? key}) : super(key: key);

  @override
  State<cropPredict> createState() => _cropPredictState();
}

class _cropPredictState extends State<cropPredict> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeScreen());
  }
}

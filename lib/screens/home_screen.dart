import 'package:croppredict/assets/common_button.dart';
import 'package:croppredict/consts/app_colors.dart';
import 'package:croppredict/screens/crops.dart';
import 'package:croppredict/screens/diseases.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        title: const Text("Home"),
        backgroundColor: AppColors.appbarColor,
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                //image: AssetImage("assets/back.jpg"),

                image: NetworkImage(
                    'https://images.unsplash.com/photo-1603642212290-9c0c2900d50e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE1fHx8ZW58MHx8fHw%3D&w=1000&q=80'),
                fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CommonButton(
                  btnName: "Crops",
                  onClick: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Crops()));
                  }),
              CommonButton(
                  btnName: "Diseases",
                  onClick: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Diseases()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}

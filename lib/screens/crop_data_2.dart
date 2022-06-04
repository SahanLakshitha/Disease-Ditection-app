import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../consts/app_colors.dart';

class CropData2 extends StatelessWidget {
  const CropData2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          title: const Text("Crops"),
          backgroundColor: AppColors.appbarColor,
        ),
        body: SingleChildScrollView(
          child: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection('Crop Data').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text("Loading...");
              return Column(
                children: <Widget>[
                  const Padding(padding: EdgeInsets.fromLTRB(20, 20, 20, 0)),
                  Image.network(
                    "http://weknowyourdreams.com/images/cabbage/cabbage-06.jpg",
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    snapshot.data?.docs[1]['Crop Name'],
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    snapshot.data?.docs[1]['Climate'],
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    snapshot.data?.docs[1]['Soil type'],
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    snapshot.data?.docs[1]['Watering Method'],
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    snapshot.data?.docs[1]['Cultivation'],
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    snapshot.data?.docs[1]['Seed requirement'],
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    snapshot.data?.docs[1]['Harvesting'],
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    snapshot.data?.docs[1]['Harvest'],
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    snapshot.data?.docs[1]['Storing and Transporting'],
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10.0),
                ],
              );
            },
          ),
        ));
  }
}

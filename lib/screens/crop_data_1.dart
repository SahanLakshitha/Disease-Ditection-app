import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../consts/app_colors.dart';

class CropData1 extends StatelessWidget {
  const CropData1({Key? key}) : super(key: key);

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
        body: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection('Crop Data').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text("Loading...");
            return Column(
              children: <Widget>[
                const Padding(padding: EdgeInsets.fromLTRB(20, 20, 20, 0)),
                Image.network(
                  "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.TXWa-1cCary3hlDJ3pWPTAHaD4%26pid%3DApi&f=1",
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                ),
                const SizedBox(height: 10.0),
                Text(
                  snapshot.data?.docs[0]['Crop name'],
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10.0),
                Text(
                  snapshot.data?.docs[0]['Climate'],
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10.0),
                Text(
                  snapshot.data?.docs[0]['Soil type'],
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10.0),
                Text(
                  snapshot.data?.docs[0]['Watering method'],
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10.0),
                Text(
                  snapshot.data?.docs[0]['Cultivation'],
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10.0),
                Text(
                  snapshot.data?.docs[0]['Seed requirement'],
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10.0),
                Text(
                  snapshot.data?.docs[0]['Harvesting'],
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10.0),
                Text(
                  snapshot.data?.docs[0]['Harvest'],
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10.0),
                Text(
                  snapshot.data?.docs[0]['Storing and Transporting'],
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10.0),
              ],
            );
          },
        ));
  }
}

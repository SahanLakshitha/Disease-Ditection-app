import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../consts/app_colors.dart';

class CropData3 extends StatelessWidget {
  const CropData3({Key? key}) : super(key: key);

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
                    "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fseedsofplenty.com.au%2Fwp-content%2Fuploads%2F2019%2F04%2FV-CUC-05p1.jpg&f=1&nofb=1",
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    snapshot.data?.docs[2]['Crop Name'],
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    snapshot.data?.docs[2]['Climate'],
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    snapshot.data?.docs[2]['Soil Type'],
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    snapshot.data?.docs[2]['Watering Method'],
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    snapshot.data?.docs[2]['Cultivation Steps'],
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    snapshot.data?.docs[2]['Seed requirement'],
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    snapshot.data?.docs[2]['Harvesting'],
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    snapshot.data?.docs[2]['Harvest'],
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    snapshot.data?.docs[2]['Storing and Transporting'],
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

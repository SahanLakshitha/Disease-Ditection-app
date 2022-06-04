import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:croppredict/assets/common_button.dart';
import 'package:croppredict/consts/app_colors.dart';
import 'package:croppredict/screens/crops.dart';

import 'package:croppredict/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'dart:async';

class Diseases extends StatefulWidget {
  CollectionReference _firebaseFireStore =
      FirebaseFirestore.instance.collection('Solutions');
  Diseases({
    Key? key,
  }) : super(key: key);

  @override
  State<Diseases> createState() => _DiseasesState();
}

class _DiseasesState extends State<Diseases> {
  File? pickedImage;
  bool isImageLoaded = false;

  late List _result;
  String _confidence = "";
  String _name = "";
  String numbers = '';

  getImageFromGallery() async {
    var tempStore = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      pickedImage = File(tempStore!.path);
      isImageLoaded = true;
    });
  }

  applyModelOnImage(File file) async {
    var res = await Tflite.runModelOnImage(
      path: file.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _result = res!;
      String str = _result[0]["label"];
      _name = str.substring(2);
      _confidence = _result != null
          ? (_result[0]['confidence'] * 100.0).toString().substring(0, 2) + "%"
          : "";
    });
  }

  @override
  void initState() {
    super.initState();
    loadMyModel();
  }

  loadMyModel() async {
    var resultant = await Tflite.loadModel(
        model: "assets/model_unquant.tflite", labels: "assets/labels.txt");

    print("Result after loading model: $resultant");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.appbarColor,
            ),
            child: const Text(
              'Diseases',
            ),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
          ),
          ListTile(
            title: const Text('Crops'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Crops()));
            },
          )
        ]),
      ),
      appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          title: const Text("Diseases"),
          backgroundColor: AppColors.appbarColor,
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(),
                  );
                },
                icon: const Icon(Icons.search))
          ]),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          isImageLoaded
              ? Center(
                  child: Container(
                    height: 350,
                    width: 350,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: FileImage(File(pickedImage!.path)),
                            fit: BoxFit.contain)),
                  ),
                )
              : Container(),
          CommonButton(
            btnName: "Submit",
            onClick: () {
              Text("Name: $_name \n Confidence: $_confidence");
            },
          ),

          //
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getImageFromGallery();
        },
        child: const Icon(Icons.photo_album),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  final CollectionReference _firebaseFireStore =
      FirebaseFirestore.instance.collection('Solutions');

  List<String> searchTerms = [
    'Chili leaves curl',
    'Monarch caterpillar',
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        // close(context, null);
        Navigator.of(context).pop();
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firebaseFireStore.snapshots().asBroadcastStream(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            //Fetch Data
            print(snapshot.data);
            return ListView(
              children: [
                ...snapshot.data!.docs
                    .where((QueryDocumentSnapshot<Object?> element) =>
                        element['Disease']
                            .toString()
                            .toLowerCase()
                            .contains(query.toLowerCase()))
                    .map((QueryDocumentSnapshot<Object?> data) {
                  final String Disease = data.get('Disease');
                  final String Solution = data['Solution'];

                  return Column(
                    children: <Widget>[
                      Text(
                        Disease,
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        Solution,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  );
                })
              ],
            );
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var dis in searchTerms) {
      if (dis.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(dis);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }
}

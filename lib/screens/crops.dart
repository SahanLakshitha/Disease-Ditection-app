import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:croppredict/assets/common_button.dart';
import 'package:croppredict/consts/app_colors.dart';
import 'package:croppredict/screens/crop_data_1.dart';
import 'package:croppredict/screens/crop_data_2.dart';
import 'package:croppredict/screens/crop_data_3.dart';
import 'package:croppredict/screens/diseases.dart';
import 'package:croppredict/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:provider/provider.dart';

class Crops extends StatefulWidget {
  @override
  State<Crops> createState() => _CropsState();
}

Stream<QuerySnapshot> getCropsStreamSnapshots(BuildContext context) async* {
  final uid = await Provider.of(context).auth.getCurrentUID();
  yield* FirebaseFirestore.instance
      .collection('crops')
      .doc(uid)
      .collection('data')
      .snapshots();
}

class _CropsState extends State<Crops> {
  String? selectedValue;
  String? selectedValue2;
  String? selectedValue3;

  List<String> items1 = [
    'Brown',
    'Black',
    'Reddish Brown',
    'Laterite',
  ];
  List<String> items2 = [
    'Surface Irrigation',
    'Localized Irrigation',
    'Sprinkler Irrigation',
  ];
  List<String> items3 = [
    'Dry Zone',
    'Intermediate zone',
    'Wet zone',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.appbarColor,
              ),
              child: const Text(
                'Crops',
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              },
            ),
            ListTile(
              title: const Text('Diseases'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Diseases()));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        title: const Text("Crops"),
        backgroundColor: AppColors.appbarColor,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                hint: Text(
                  'Soil Type',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: items1
                    .map((items1) => DropdownMenuItem<String>(
                          value: items1,
                          child: Text(
                            items1,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                value: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value as String;
                  });
                },
                buttonHeight: 60,
                buttonWidth: 200,
                itemHeight: 40,
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton2(
              hint: Text(
                'Watering method',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).hintColor,
                ),
              ),
              items: items2
                  .map((items2) => DropdownMenuItem<String>(
                        value: items2,
                        child: Text(
                          items2,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                  .toList(),
              value: selectedValue2,
              onChanged: (value) {
                setState(() {
                  selectedValue2 = value as String;
                });
              },
              buttonHeight: 60,
              buttonWidth: 200,
              itemHeight: 40,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton2(
              hint: Text(
                'Climate',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).hintColor,
                ),
              ),
              items: items3
                  .map((items3) => DropdownMenuItem<String>(
                        value: items3,
                        child: Text(
                          items3,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                  .toList(),
              value: selectedValue3,
              onChanged: (value) {
                setState(() {
                  selectedValue3 = value as String;
                });
              },
              buttonHeight: 60,
              buttonWidth: 200,
              itemHeight: 40,
            ),
          ),
          CommonButton(
            btnName: "Submit",
            onClick: () {
              if (selectedValue == 'Brown' &&
                  selectedValue2 == 'Localized Irrigation' &&
                  selectedValue3 == 'Dry Zone') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CropData1()));
              } else if (selectedValue == 'Black' &&
                  selectedValue2 == 'Surface Irrigation' &&
                  selectedValue3 == 'Wet zone') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CropData2()));
              } else if (selectedValue == 'Brown' &&
                  selectedValue2 == 'Localized Irrigation' &&
                  selectedValue3 == 'Intermediate zone') {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CropData3()));
              } else {
                const Text("No matching data");
              }
            },
          ),
        ],
      ),
    );
  }
}

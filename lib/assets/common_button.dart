import 'package:croppredict/consts/app_colors.dart';
import 'package:croppredict/screens/crops.dart';
import 'package:croppredict/screens/home_screen.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  late String btnName;
  void Function()? onClick;
  CommonButton({Key? key, required this.btnName, this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onClick,
        child: Container(
          decoration: BoxDecoration(color: AppColors.appbarColor, boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 5)
          ]),
          height: 60,
          width: 280,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Text(this.btnName,
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              )),
        ),
      ),
    );
  }
}

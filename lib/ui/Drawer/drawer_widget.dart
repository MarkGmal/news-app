import 'package:flutter/material.dart';
import 'package:news_app/utils/app_styles.dart';

class DrawerWidget extends StatelessWidget {
  final String imageName;
  final String text;
  const DrawerWidget({super.key, required this.imageName, required this.text});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding:  EdgeInsets.all(width * 0.03),
      child: Row(
        spacing: 10,
        children: [
          Image.asset(imageName),
          Text(text, style: AppStyles.bold20White),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:news_app/Providers/app_theme_provider.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: height * 0.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusGeometry.circular(20),
        border: Border.all(color: AppColors.whiteColor, width: 1.5),
        color: AppColors.blackColor,
      ),
      child: GestureDetector(
        onTap: () {
          themeProvider.changeMode(
            themeProvider.isDark ? ThemeMode.light : ThemeMode.dark,
          );
        },
        child: themeProvider.isDark
            ? Text("Light", style: AppStyles.medium20White)
            : Text("Dark", style: AppStyles.medium20White),
      ),
    );
  }
}

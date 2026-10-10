import 'package:flutter/material.dart';
import 'package:news_app/ui/Drawer/drawer_widget.dart';
import 'package:news_app/ui/Drawer/Sections/Theme%20Section/theme_section.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_images.dart';
import 'package:news_app/utils/app_styles.dart';

class HomeDrawer extends StatelessWidget {
  VoidCallback onDrawerItemClick;
  HomeDrawer({super.key, required this.onDrawerItemClick});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: height * 0.2,
          color: AppColors.whiteColor,
          child: Text("News App", style: AppStyles.bold24Black),
        ),
        GestureDetector(
          onTap: () {
            onDrawerItemClick();
          },
          child: DrawerWidget(
            imageName: AppImages.homeIcon,
            text: "Go To Home",
          ),
        ),
        Divider(thickness: 2, indent: 20, endIndent: 20),
        DrawerWidget(imageName: AppImages.themeIcon, text: "Theme"),
        ThemeSection(),
        Divider(thickness: 2, indent: 20, endIndent: 20),
        DrawerWidget(imageName: AppImages.languageIcon, text: "Language"),
        ThemeSection(), // TODO: Language section
      ],
    );
  }
}

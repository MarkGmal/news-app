import 'package:flutter/material.dart';
import 'package:news_app/Providers/app_theme_provider.dart';
import 'package:news_app/ui/Drawer/Sections/Theme%20Section/theme_bottom_sheet.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:provider/provider.dart';

class ThemeSection extends StatefulWidget {
  const ThemeSection({super.key});

  @override
  State<ThemeSection> createState() => _ThemeSectionState();
}

class _ThemeSectionState extends State<ThemeSection> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        showThemeBottomSheet();
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: height * 0.01,
          horizontal: width * 0.03,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.03,
          vertical: height * 0.02,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusGeometry.circular(16),
          border: Border.all(color: AppColors.whiteColor, width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              themeProvider.isDark ? "Dark" : "Light",
              style: AppStyles.medium20White,
            ),
            Icon(
              Icons.keyboard_arrow_down_outlined,
              size: 30,
              color: AppColors.whiteColor,
            ),
          ],
        ),
      ),
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ThemeBottomSheet(),
    );
  }
}

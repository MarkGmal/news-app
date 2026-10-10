import 'package:flutter/material.dart';
import 'package:news_app/Model/category_model.dart';
import 'package:news_app/utils/app_colors.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel categoryModel;
  final int index;
  const CategoryCard({
    super.key,
    required this.categoryModel,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    bool isEven = index % 2 == 0;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: height * 0.01),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusGeometry.circular(25),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        alignment: isEven ? Alignment.bottomRight : Alignment.bottomLeft,
        children: [
          Image.asset(categoryModel.image),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: width * 0.02,
              vertical: height * 0.02,
            ),
            padding: EdgeInsetsDirectional.only(
              start: isEven ? height * 0.02 : 0,
              end: isEven ? 0 : height * 0.02,
            ),
            width: width * 0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusGeometry.circular(84),
              color: AppColors.greyColor,
            ),
            child: Row(
              textDirection: isEven ? TextDirection.ltr : TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "View All",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  radius: 30,
                  child: Icon(
                    isEven ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
                    size: 20,
                    color: Theme.of(context).canvasColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

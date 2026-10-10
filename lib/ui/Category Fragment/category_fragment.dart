import 'package:flutter/material.dart';
import 'package:news_app/Model/category_model.dart';
import 'package:news_app/Providers/app_theme_provider.dart';
import 'package:news_app/ui/Category%20Fragment/category_card.dart';
import 'package:provider/provider.dart';

typedef OnCategoryItemClick =void Function(CategoryModel);

class CategoryFragment extends StatelessWidget {
  CategoryFragment({super.key, required this.onCategoryItemClick});
  List<CategoryModel> categoryList = [];
  OnCategoryItemClick onCategoryItemClick;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    categoryList = CategoryModel.getCategoryList(themeProvider.isDark);
    return Column(
      children: [
        Text(
          "Good Morning\nHere is Some News For You",
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(fontSize: 24),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.only(top: height * 0.03),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  onCategoryItemClick(categoryList[index]);
                },
                child: CategoryCard(
                  categoryModel: categoryList[index],
                  index: index,
                ),
              );
            },
            separatorBuilder: (context, index) =>
                SizedBox(height: height * .02),
            itemCount: categoryList.length,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Model/category_model.dart';
import 'package:news_app/ui/Category%20Details/category_details.dart';
import 'package:news_app/ui/Category%20Fragment/category_fragment.dart';
import 'package:news_app/ui/Drawer/home_drawer.dart';
import 'package:news_app/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: AppColors.blackColor,
        child: HomeDrawer(onDrawerItemClick: onDrawerItemClick),
      ),
      appBar: AppBar(
        title: Text(
          selectedCategory != null ? selectedCategory!.title : 'Home',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: selectedCategory == null
          ? CategoryFragment(onCategoryItemClick: onCategoryItemClick)
          : CategoryDetails(categoryModel: selectedCategory!),
    );
  }

  CategoryModel? selectedCategory;

  void onCategoryItemClick(CategoryModel newCategory) {
    selectedCategory = newCategory;
    setState(() {});
  }

  void onDrawerItemClick() {
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}

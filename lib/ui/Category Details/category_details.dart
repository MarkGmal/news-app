import 'package:flutter/material.dart';
import 'package:news_app/Model/category_model.dart';
import 'package:news_app/Model/source_response_model.dart';
import 'package:news_app/apis/http_apis_manger.dart';
import 'package:news_app/ui/Category%20Details/Widget/source_tab_widget.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';

class CategoryDetails extends StatefulWidget {
  CategoryModel categoryModel;
   CategoryDetails({super.key,required this.categoryModel});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse>(
      future: ApisManger.getSources(categoryId: widget.categoryModel.id),
      builder: (context, snapshot) {
        // ToDO: is loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: AppColors.whiteColor,
              color: AppColors.greyColor,
            ),
          );
        }
        // ToDO: error from client
        if (snapshot.hasError) {
          return Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Something went wrong",
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                onPressed: () {
                  ApisManger.getSources(categoryId: widget.categoryModel.id);
                  setState(() {});
                },
                child: Text("Try again", style: AppStyles.bold16Black),
              ),
            ],
          );
        }
        // ToDO: response server  error
        if (snapshot.data?.status != "ok") {
          return Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                snapshot.data!.message!,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                onPressed: () {
                  ApisManger.getSources(categoryId: widget.categoryModel.id);
                  setState(() {});
                },
                child: Text("Try again", style: AppStyles.bold16Black),
              ),
            ],
          );
        }
        // ToDO: response server  ok
        var sourceList = snapshot.data?.sources ?? [];
        return SourceTabWidget(sourcesList: sourceList);
      },
    );
  }
}

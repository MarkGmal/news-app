import 'package:flutter/material.dart';
import 'package:news_app/Model/news_response_model.dart';
import 'package:news_app/Model/source_response_model.dart';
import 'package:news_app/apis/http_apis_manger.dart';
import 'package:news_app/ui/News/news_card.dart';
import 'package:news_app/utils/app_colors.dart';

class NewsWidget extends StatefulWidget {
  final Sources sourceId;
  const NewsWidget({super.key, required this.sourceId});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return FutureBuilder<NewsResponse>(
      future: ApisManger.getNewsBySourceId(widget.sourceId.id ?? ""),
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
              Text("Something went wrong", textAlign: TextAlign.center),
              ElevatedButton(
                onPressed: () {
                  ApisManger.getNewsBySourceId(widget.sourceId.id ?? "");
                  setState(() {});
                },
                child: Text(
                  "Try again",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
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
              Text(snapshot.data!.message!, textAlign: TextAlign.center),
              ElevatedButton(
                onPressed: () {
                  ApisManger.getNewsBySourceId(widget.sourceId.id ?? "");
                  setState(() {});
                },
                child: Text(
                  "Try again",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          );
        }
        // ToDO: response server  ok
        var newsList = snapshot.data?.articles ?? [];
        return ListView.separated(
          padding: EdgeInsets.only(top: height * 0.02),
          separatorBuilder: (context, index) => SizedBox(height: height * 0.01),
          itemBuilder: (context, index) {
            return NewsCard(news: newsList[index]);
          },
          itemCount: newsList.length,
        );
      },
    );
  }
}

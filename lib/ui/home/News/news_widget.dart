import 'package:flutter/material.dart';
import 'package:news_app/Model/news_response.dart';
import 'package:news_app/Model/source_response.dart';
import 'package:news_app/apis/http_apis_manger.dart';
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
        return ListView.builder(
          itemBuilder: (context, index) {
            return Text(
              newsList[index].title ?? "",
              style: Theme.of(context).textTheme.labelLarge,
            );
          },
          itemCount: newsList.length,
        );
      },
    );
  }
}

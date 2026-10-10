import 'package:flutter/material.dart';
import 'package:news_app/Model/source_response_model.dart';
import 'package:news_app/ui/Category%20Details/Widget/source_name_widget.dart';
import 'package:news_app/ui/News/news_widget.dart';
import 'package:news_app/utils/app_colors.dart';

class SourceTabWidget extends StatefulWidget {
  final List<Sources> sourcesList;
  const SourceTabWidget({super.key, required this.sourcesList});

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourcesList.length,
      child: Column(
        children: [
          TabBar(
            dividerColor: AppColors.transparentColor,
            indicatorColor: Theme.of(context).canvasColor,
            tabAlignment: TabAlignment.start,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            isScrollable: true,
            tabs: widget.sourcesList.map((sources) {
              return SourceNameWidget(
                sourcesName: sources,
                isSelected:
                    selectedIndex == widget.sourcesList.indexOf(sources),
              );
            }).toList(),
          ),
          Expanded(child: NewsWidget(sourceId: widget.sourcesList[selectedIndex]))
        ],
      ),
    );
  }
}

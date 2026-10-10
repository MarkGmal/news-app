import 'package:flutter/material.dart';
import 'package:news_app/Model/source_response_model.dart';

class SourceNameWidget extends StatelessWidget {
  final Sources sourcesName;
  final bool isSelected;
  const SourceNameWidget({
    super.key,
    required this.sourcesName,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      sourcesName.name ?? "",
      style: isSelected
          ? Theme.of(context).textTheme.labelLarge
          : Theme.of(context).textTheme.labelMedium,
    );
  }
}

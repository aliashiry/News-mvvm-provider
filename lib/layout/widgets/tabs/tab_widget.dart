import 'package:flutter/material.dart';
import 'package:news/layout/widgets/category/category_details_view_model.dart';
import 'package:news/layout/widgets/news/news_widget.dart';
import 'package:news/layout/widgets/tabs/tab_item.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:provider/provider.dart';

class TabWidget extends StatefulWidget {
  List<Source> sourcesList = [];

  TabWidget({super.key, required this.sourcesList});

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
//  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryDetailsViewModel>(
        builder: (context, value, child) => DefaultTabController(
            length: widget.sourcesList.length,
            child: Column(
              children: [
                TabBar(
                  onTap: (index) {
                    value.updateSelectedIndex(index);
                  },
                  isScrollable: true,
                  indicatorColor: Colors.transparent,
                  tabs: widget.sourcesList
                      .map((source) => TabItem(
                            source: source,
                        isSelected: value.selectedIndex ==
                                widget.sourcesList.indexOf(source),
                          ))
                      .toList(),
                ),
                Expanded(
                    child: NewsWidget(
                        source: widget.sourcesList[value.selectedIndex])),
              ],
            )));
  }
}

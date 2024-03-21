import 'package:flutter/material.dart';
import 'package:news/core/theme/theme.dart';
import 'package:news/layout/widgets/category/category_details.dart';
import 'package:news/layout/widgets/category/category_fragment.dart';
import 'package:news/layout/widgets/drawer/home_drawer.dart';
import 'package:news/layout/widgets/tabs/settings.dart';
import 'package:news/model/category.dart';
import 'package:news/pages/search_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: MyTheme.whiteColor,
          child: Image.asset(
            'assets/images/main_background.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              selectedMenuItem == HomeDrawer.settings
                  ? 'Settings'
                  : selectCategory == null
                      ? 'News App'
                      : selectCategory!.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            actions: [
              // isIconClicked ? SearchBox() :
              IconButton(
                onPressed: () {
                  // isIconClicked = !isIconClicked;
                  setState(() {
                    showSearch(context: context, delegate: NewsSearch());
                  });
                },
                icon: Icon(Icons.search),
              ),
            ],
          ),
          drawer: Drawer(
            child: HomeDrawer(onSideMenuItemClick: onSideMenuItemClick),
          ),
          body: selectedMenuItem == HomeDrawer.settings
              ? const SettingsTab()
              : selectCategory == null
                  ? CategoryFragment(onCategoryClick: onCategoryClick)
                  : CategoryDetails(category: selectCategory!),
        )
      ],
    );
  }

  CategoryDM? selectCategory;

  void onCategoryClick(CategoryDM newSelectedCategory) {
    setState(() {
      selectCategory = newSelectedCategory;
    });
  }

  int selectedMenuItem = HomeDrawer.categories;

  void onSideMenuItemClick(int newSelectedMenuItem) {
    setState(() {
      selectedMenuItem = newSelectedMenuItem;
      selectCategory = null;
      Navigator.pop(context);
    });
  }
}

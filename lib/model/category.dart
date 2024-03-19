import 'package:flutter/material.dart';
import 'package:news/core/theme/theme.dart';

class CategoryDM {
  String id;
  String title;
  String imagePath;
  Color color;

  CategoryDM(
      {required this.title,
      required this.imagePath,
      required this.id,
      required this.color});

  static List<CategoryDM> getCategories() {
    return [
      CategoryDM(
          title: 'Sports',
          imagePath: 'assets/images/ball.png',
          id: 'sports',
          color: MyTheme.redColor),
      CategoryDM(
          title: 'General',
          imagePath: 'assets/images/Politics.png',
          id: 'general',
          color: MyTheme.blueColor),
      CategoryDM(
          title: 'Health',
          imagePath: 'assets/images/health.png',
          id: 'health',
          color: MyTheme.pinkColor),
      CategoryDM(
          title: 'Business',
          imagePath: 'assets/images/bussines.png',
          id: 'business',
          color: MyTheme.brownColor),
      CategoryDM(
          title: 'Entertainment',
          imagePath: 'assets/images/environment.png',
          id: 'entertainment',
          color: MyTheme.blueColor),
      CategoryDM(
          title: 'Science',
          imagePath: 'assets/images/science.png',
          id: 'science',
          color: MyTheme.yellowColor),
    ];
  }
}

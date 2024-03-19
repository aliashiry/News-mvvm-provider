import 'package:flutter/material.dart';
import 'package:news/layout/widgets/category/category_item.dart';
import 'package:news/model/category.dart';

class CategoryFragment extends StatelessWidget {
  var categoriesList = CategoryDM.getCategories();
  Function onCategoryClick;

  CategoryFragment({required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Pick your category \n of interest',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      onCategoryClick(categoriesList[index]);
                    },
                    child: CategoryItme(
                        category: categoriesList[index], index: index));
              },
              itemCount: categoriesList.length,
            ),
          )
        ],
      ),
    );
  }
}

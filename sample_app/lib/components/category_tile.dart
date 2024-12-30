import 'package:flutter/material.dart';
import 'package:sample_app/data/categories.dart';

class CategoryTile extends StatelessWidget {
  CategoryTile({super.key, required this.category});
  Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(category.categoryName),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:sample_app/src/data/categories.dart';

// ignore: must_be_immutable
class CategoryTile extends StatelessWidget {
  CategoryTile({super.key, required this.category});
  Category category;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(category.categoryName),
      ],
    );
  }
}

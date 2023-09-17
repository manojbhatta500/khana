import 'package:flutter/material.dart';

class CategoryItem {
  final String id;
  final String title;
  final Color color;
  CategoryItem(
      {required this.id, required this.title, this.color = Colors.lightBlue});
}

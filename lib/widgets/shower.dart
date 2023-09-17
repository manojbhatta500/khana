import 'package:flutter/material.dart';
import 'package:khana/models/categoryitem.dart';

import 'package:khana/screens/meal.dart';
import 'package:khana/data/catagorydata.dart';

class Shower extends StatelessWidget {
  Shower({
    super.key,
    required this.categoryItem,
  });

  final CategoryItem categoryItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final List filteredlist = individual
            .where((Dish) => Dish.categories.contains(categoryItem.id))
            .toList();
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Meal(
                  title: categoryItem.title,
                  getlist: filteredlist,
                )));
      },
      splashColor: Colors.deepPurple,
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                colors: [categoryItem.color, Colors.redAccent],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft)),
        child: Center(
          child: Text(
            categoryItem.title,
            style: TextStyle(fontSize: 20, wordSpacing: 1),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:khana/data/catagorydata.dart';
import 'package:khana/widgets/shower.dart';

class ChooseScreen extends StatelessWidget {
  const ChooseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("categories")),
        ),
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Adjust this value as needed
              mainAxisSpacing: 10.0, // Adjust spacing between rows
              crossAxisSpacing: 10.0, // Adjust spacing between columns
              childAspectRatio:
                  1.0, // Adjust the aspect ratio to control item size
            ),
            itemCount: totalcategory.length,
            itemBuilder: (context, index) {
              return Shower(categoryItem: totalcategory[index]);
            }));
  }
}

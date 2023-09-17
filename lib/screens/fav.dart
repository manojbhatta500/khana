import 'package:flutter/material.dart';
import 'package:khana/models/dish.dart';
import 'package:khana/screens/mealdetail.dart';

class Fav extends StatelessWidget {
  Fav({super.key});
  final List<Dish> favpage = favmeal;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Favroite')),
      ),
      body: ListView.builder(
        itemCount: favmeal.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      Mealdetail(dishdetail: favpage[index])));
            },
            splashColor: Colors.blueGrey,
            child: Container(
              height: 0.3 * height,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black87.withOpacity(0.5)),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    child: ClipRRect(
                      // Use ClipRRect to clip the image to the border radius
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        favpage[index].imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black87.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(30)),
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              favpage[index].title.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.alarm,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                Text(
                                  ' ${favpage[index].duration.toString()} min',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        )),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

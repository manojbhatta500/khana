import 'package:flutter/material.dart';
import 'package:khana/models/dish.dart';

List<Dish> favmeal = [];
bool isFavorite = false;

class Mealdetail extends StatefulWidget {
  Mealdetail({super.key, required this.dishdetail});
  final Dish dishdetail;

  @override
  State<Mealdetail> createState() => _MealdetailState();
}

class _MealdetailState extends State<Mealdetail> {
  void toggleFavorite(Dish dish, bool isFavorite) {
    if (isFavorite) {
      if (!favmeal.contains(dish)) {
        setState(() {
          favmeal.add(dish);
        });
      }
    } else {
      if (favmeal.contains(dish)) {
        setState(() {
          favmeal.remove(dish);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.dishdetail.title)),
        actions: [
          IconButton(
            icon:
                isFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
                toggleFavorite(widget.dishdetail, isFavorite);
              });
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 0.5 * height,
            width: double.infinity,
            child: ClipRRect(
              child: Image.network(
                widget.dishdetail.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Dish Name',
                    style: TextStyle(fontSize: 18, color: Colors.black)),
                Text(
                  widget.dishdetail.title,
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
                Divider(
                  endIndent: 20,
                  indent: 20,
                  color: Colors.white,
                ),
                Text('Ingrident',
                    style: TextStyle(fontSize: 18, color: Colors.black)),
                Text(
                  ' - ${widget.dishdetail.ingredients.join('\n - ')}',
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
                Divider(
                  endIndent: 20,
                  indent: 20,
                  color: Colors.white,
                ),
                Text('Steps to cook',
                    style: TextStyle(fontSize: 18, color: Colors.black)),
                Text(
                  ' - ${widget.dishdetail.steps.join('\n - ')}',
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
                Divider(
                  endIndent: 20,
                  indent: 20,
                  color: Colors.white,
                ),
                ListTile(
                  title: Text('Gluten-Free',
                      style: TextStyle(fontSize: 15, color: Colors.black)),
                  leading: Icon(
                    widget.dishdetail.isGlutenFree ? Icons.check : Icons.close,
                    color: widget.dishdetail.isGlutenFree
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
                ListTile(
                  title: Text('Vegan',
                      style: TextStyle(fontSize: 15, color: Colors.black)),
                  leading: Icon(
                    widget.dishdetail.isVegan ? Icons.check : Icons.close,
                    color:
                        widget.dishdetail.isVegan ? Colors.green : Colors.red,
                  ),
                ),
                ListTile(
                  title: Text('Vegetarian',
                      style: TextStyle(fontSize: 15, color: Colors.black)),
                  leading: Icon(
                    widget.dishdetail.isVegetarian ? Icons.check : Icons.close,
                    color: widget.dishdetail.isVegetarian
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
                ListTile(
                  title: Text('Lactose-Free',
                      style: TextStyle(fontSize: 15, color: Colors.black)),
                  leading: Icon(
                    widget.dishdetail.isLactoseFree ? Icons.check : Icons.close,
                    color: widget.dishdetail.isLactoseFree
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
                Divider(
                  endIndent: 20,
                  indent: 20,
                  color: Colors.white,
                ),
                Text(
                    'Affordability: ${widget.dishdetail.affordability.toString().split('.').last}',
                    style: TextStyle(fontSize: 15, color: Colors.black)),
                Text(
                    'Complexity: ${widget.dishdetail.complexity.toString().split('.').last}',
                    style: TextStyle(fontSize: 15, color: Colors.black)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

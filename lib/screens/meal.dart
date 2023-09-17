import 'package:flutter/material.dart';
import 'package:khana/screens/mealdetail.dart';

class Meal extends StatelessWidget {
  const Meal({Key? key, required this.title, required this.getlist})
      : super(key: key);
  final String title;
  final List getlist;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(title)),
      ),
      body: ListView.builder(
        itemCount: getlist.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      Mealdetail(dishdetail: getlist[index])));
            },
            splashColor: Colors.blueGrey,
            child: Container(
              height: 0.3 * height,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black87.withOpacity(0.2)),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        getlist[index].imageUrl,
                        fit: BoxFit.cover, // Set the fit property to cover
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black87.withOpacity(0.3),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                      ),
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            getlist[index].title.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
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
                                ' ${getlist[index].duration.toString()} min',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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

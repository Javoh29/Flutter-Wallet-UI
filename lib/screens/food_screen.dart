import 'package:flutter/material.dart';
import 'package:flutterui/models/food_model.dart';

class FoodScreen extends StatefulWidget {

  final Foods foods;

  FoodScreen({this.foods});

  @override
  _FoodScreenState createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Hero(
                  tag: widget.foods.imageUrl,
                  child: Container(
                    height: MediaQuery.of(context).size.height/1.8,
                    child: Image(
                      image: AssetImage(widget.foods.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 25,
                        ),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                          size: 25,
                        ),
                        onPressed: (){},
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height/1.5,
              transform: Matrix4.translationValues(0.0, -10.0, 0.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                color: Colors.white
              ),
              child: ListView(
                padding: EdgeInsets.fromLTRB(25, 90, 25, 10),
                children: <Widget>[
                  Container(
                      height: 150,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: Container(
                          height: 125,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image(
                              image: AssetImage(widget.foods.ingred[0].imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0,1),
                                    blurRadius: 6
                                )
                              ]
                          ),
                        ),
                      ),
                  ),
                  Container(
                      height: 100,
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: Container(
                          height: 125,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image(
                              image: AssetImage(widget.foods.ingred[1].imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0,1),
                                blurRadius: 6
                              )
                            ]
                          ),
                        ),
                      )
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}

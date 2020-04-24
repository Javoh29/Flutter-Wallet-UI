import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterui/models/food_model.dart';

import 'food_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  TabController _tabController;
  int navBar = 0;

  Widget _buildFoods(int index){
    return Container(
      height: 222,
      width: 167,
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white
      ),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (_) => FoodScreen(foods: foods[index],),
              ));
            },
            child: Container(
              height: 145,
              width: 145,
              margin: EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image(
                  image: AssetImage(foods[index].imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      foods[index].name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        '${foods[index].ingredients} ingredients',
                        style: TextStyle(
                          color: Color(0xFFA3A8B0),
                          fontSize: 14,
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  height: 35,
                  width: 35,
                  margin: EdgeInsets.only(top: 5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).accentColor,
                  ),
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                    size: 20,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFoodsPop(int index){
    return Container(
      height: 270,
      width: 150,
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white
      ),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 205,
                width: 135,
                margin: EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image(
                    image: AssetImage(foodsPop[index].imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                height: 20,
                width: 42,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      foodsPop[index].likes.toString(),
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Icon(
                      Icons.favorite,
                      size: 12,
                      color: Theme.of(context).accentColor,
                    )
                  ],
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            alignment: Alignment.centerLeft,
            child: Column(
              children: <Widget>[
                Text(
                  foodsPop[index].name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    '${foodsPop[index].ingredients} ingredients',
                    style: TextStyle(
                        color: Color(0xFFA3A8B0),
                        fontSize: 14,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: SafeArea(
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 40, left: 20, right: 20),
                height: 50,
                alignment: Alignment.centerLeft,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFEBEBEB)
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'What’s your ingredient, Fida?',
                        hintStyle: TextStyle(
                            color: Color(0xFFA3A8B0),
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                        ),
                        icon: Icon(
                          Icons.search,
                          color: Color(0xFFA3A8B0),
                          size: 25,
                        )
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'Recomended',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                          color: Color(0xFFA3A8B0),
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 225,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.center,
                child: ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: foods.length,
                    itemBuilder: (context, index){
                      return _buildFoods(index);
                    }
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: TabBar(
                  controller: _tabController,
                  indicatorColor: Theme.of(context).accentColor,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 2,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey.withOpacity(0.6),
                  labelPadding: EdgeInsets.symmetric(horizontal: 15.0),
                  isScrollable: true,
                  tabs: <Widget>[
                    Tab(
                      child: Text(
                        'Popular',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Vegetable',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Fruit',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Meat',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 280,
                width: double.infinity,
                margin: EdgeInsets.only(left: 20),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: foodsPop.length,
                    itemBuilder: (context, index){
                      return _buildFoodsPop(index);
                    }
                ),
              )
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 65,
        color: Colors.white,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                size: 30,
                color: navBar == 0 ? Theme.of(context).accentColor : Colors.grey,
              ),
              onPressed: (){
                setState(() {
                  navBar = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.image,
                size: 30,
                color: navBar == 1 ? Theme.of(context).accentColor : Colors.grey,
              ),
              onPressed: (){
                setState(() {
                  navBar = 1;
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.favorite,
                size: 30,
                color: navBar == 2 ? Theme.of(context).accentColor : Colors.grey,
              ),
              onPressed: (){
                setState(() {
                  navBar = 2;
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.person,
                size: 30,
                color: navBar == 3 ? Theme.of(context).accentColor : Colors.grey,
              ),
              onPressed: (){
                setState(() {
                  navBar = 3;
                });
              },
            )
          ],
        ),
      ),
    );
  }

}

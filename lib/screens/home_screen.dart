import 'package:flutter/material.dart';
import 'package:flutterui/widgets/decorations.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Hello',
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 18,
                            fontFamily: 'WorkSans',
                          ),
                        ),
                        Text(
                          'Caesar Candil!',
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 18,
                            fontFamily: 'WorkSans',
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.person,
                      color: Theme.of(context).accentColor,
                      size: 30,
                    )
                  ],
                ),
              ),
              Container(
                height: 42,
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 15),
                alignment: Alignment.center,
                decoration: ConcaveDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  ),
                  colors: [Color.fromRGBO(216, 213, 208, 1), Colors.white],
                  depression: 5
                ),
                child: TextField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 12,
                      fontFamily: 'WorkSans'
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search for songs, artists, podcasts, etc.',
                    hintStyle: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 12,
                        fontFamily: 'WorkSans'
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Theme.of(context).accentColor,
                      size: 15,
                    ),
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}

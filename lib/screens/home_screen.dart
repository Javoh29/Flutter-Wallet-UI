import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  final List<String> marks = [
    'Tomorrow',
    '2 Adults',
    'Business',
    'Selected airlines',
    'Airlines',
    'Tickets',
  ];

  Widget _buildMarks(int index){
    return Container(
      height: 25,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 15),
      margin: EdgeInsets.only(right: 10, top: 15, left: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0, -3),
                blurRadius: 6
            )
          ]
      ),
      child: Text(
        marks[index],
        style: TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontFamily: 'Montserrat'
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 180,
              width: double.infinity,
              padding: EdgeInsets.only(top: 50, left: 25),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Book a flight request:',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12,
                      color: Colors.white
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            'Las Vegas',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontSize: 20
                            ),
                          ),
                          Container(
                            height: 20,
                            width: 20,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Image(
                              image: AssetImage('assets/images/plane_black.png'),
                            )
                          ),
                          Text(
                            'Tokyo',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Montserrat',
                                fontSize: 20
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'Add',
                            style: TextStyle(
                                color: Theme.of(context).indicatorColor,
                                fontFamily: 'Montserrat',
                                fontSize: 14
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5, right: 20),
                            child: ClipOval(
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).indicatorColor,
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    height: 45,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: marks.length,
                        itemBuilder: (context, index){
                          return _buildMarks(index);
                        }
                    )
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'CHOOSE A FLIGHT',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  Container(
                    height: 30,
                    padding: EdgeInsets.only(left: 15, right: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0,0),
                          blurRadius: 8
                        )
                      ]
                    ),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'All stops',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        ClipOval(
                          child: Container(
                            height: 20,
                            width: 20,
                            color: Colors.grey[300],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Stack(
              children: <Widget>[
                
              ],
            )
          ],
        ),
      ),
    );
  }
}

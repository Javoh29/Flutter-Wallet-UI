import 'package:flutter/material.dart';
import 'package:flutterui/widgets/decorations.dart';

class PlayerScreen extends StatefulWidget {
  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen>{

  bool onPlay = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                offset: -Offset(2, 2),
                                color: Colors.white,
                              ),
                              BoxShadow(
                                blurRadius: 3,
                                offset: Offset(2, 2),
                                color: Colors.grey[400],
                              )
                            ]
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          size: 25,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'PLAYING FROM PODCAST',
                          style: TextStyle(
                            fontSize: 10,
                            color: Theme.of(context).accentColor,
                            fontFamily: 'WorkSans',
                          ),
                        ),
                        Text(
                          'Kang Desain',
                          style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context).accentColor,
                            fontFamily: 'WorkSans',
                            fontWeight: FontWeight.w600
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              offset: -Offset(2, 2),
                              color: Colors.white,
                            ),
                            BoxShadow(
                              blurRadius: 3,
                              offset: Offset(2, 2),
                              color: Colors.grey[400],
                            )
                          ]
                      ),
                      child: Icon(
                        Icons.more_vert,
                        size: 25,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ],
                ),
              ),
              Hero(
                tag: 'cover',
                child: Container(
                  height: 300,
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(20, 50, 20, 20),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 8,
                          offset: -Offset(5, 5),
                          color: Colors.white,
                        ),
                        BoxShadow(
                          blurRadius: 8,
                          offset: Offset(5, 5),
                          color: Colors.grey[400],
                        )
                      ]
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      image: AssetImage('assets/images/cover.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 250,
                child: Text(
                  'Eps. 02 - Membahas Roledan Tools di Dunia UI/UX. Wow, No. 9 Bikin Kaget!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'WorkSans',
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.w600,
                    height: 1.5
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 40, 20, 40),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '21:04',
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 12,
                              fontFamily: 'WorkSans'
                          ),
                        ),
                        Text(
                          '45:44',
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 12,
                              fontFamily: 'WorkSans'
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 15,
                      margin: EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3,
                            offset: -Offset(2, 2),
                            color: Colors.white,
                          ),
                          BoxShadow(
                            blurRadius: 3,
                            offset: Offset(2, 2),
                            color: Colors.grey[400],
                          )
                        ]
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          backgroundColor: Theme.of(context).primaryColor,
                          valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).accentColor),
                          value: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            offset: -Offset(3, 3),
                            color: Colors.white,
                          ),
                          BoxShadow(
                            blurRadius: 5,
                            offset: Offset(3, 3),
                            color: Colors.grey[400],
                          )
                        ]
                      ),
                      child: Icon(
                        Icons.redo,
                        size: 20,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              offset: -Offset(3, 3),
                              color: Colors.white,
                            ),
                            BoxShadow(
                              blurRadius: 5,
                              offset: Offset(3, 3),
                              color: Colors.grey[400],
                            )
                          ]
                      ),
                      child: Icon(
                        Icons.skip_previous,
                        size: 30,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          onPlay ? onPlay = false : onPlay = true;
                        });
                      },
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: onPlay ? BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                offset: -Offset(4, 4),
                                color: Colors.white,
                              ),
                              BoxShadow(
                                blurRadius: 5,
                                offset: Offset(4, 4),
                                color: Colors.grey[400],
                              )
                            ]
                        ) : ConcaveDecoration(
                            shape: CircleBorder(),
                            colors: [Colors.grey[400], Colors.white70],
                            depression: 5
                        ),
                        child: Icon(
                          onPlay ? Icons.play_arrow : Icons.pause,
                          size: 35,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                    Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              offset: -Offset(3, 3),
                              color: Colors.white,
                            ),
                            BoxShadow(
                              blurRadius: 5,
                              offset: Offset(3, 3),
                              color: Colors.grey[400],
                            )
                          ]
                      ),
                      child: Icon(
                        Icons.skip_next,
                        size: 30,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              offset: -Offset(3, 3),
                              color: Colors.white,
                            ),
                            BoxShadow(
                              blurRadius: 5,
                              offset: Offset(3, 3),
                              color: Colors.grey[400],
                            )
                          ]
                      ),
                      child: Icon(
                        Icons.cached,
                        size: 20,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterui/models/wallet_model.dart';
import 'package:flutterui/utils/constants.dart';

class CardScreen extends StatefulWidget {
  final Cards card;

  CardScreen({this.card});

  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {

  Widget _buildServices({String text, Image image, Color color}){
    return Column(
      children: <Widget>[
        Container(
          height: 62,
          width: 62,
          margin: EdgeInsets.only(bottom: 18),
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color
          ),
          child: image,
        ),
        Text(
          text,
          style: kTextStyle(15, FontWeight.w500),
        )
      ],
    );
  }

  Widget _buildCard({String image}){
    return Container(
      height: 105,
      width: 205,
      margin: EdgeInsets.only(left: 20, top: 10, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 4),
            blurRadius: 15
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light,);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 270,
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(25, 40, 25, 35),
              decoration: BoxDecoration(
                gradient: widget.card.linearGradient,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 25,
                        ),
                        onTap: (){
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image(
                            image: AssetImage('assets/images/user.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Balance',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              letterSpacing: 1.5
                            ),
                          ),
                          Text(
                            '\$${widget.card.balance}',
                            style: TextStyle(
                                fontSize: 34,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: widget.card.size,
                        child: Image(
                          image: AssetImage(widget.card.logo),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '****',
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 2,
                            fontSize: 24,
                            shadows: [
                              Shadow(
                                  color: Colors.black45,
                                  offset: Offset(1,2),
                                  blurRadius: 2
                              ),
                            ]
                        ),
                      ),
                      Text(
                        '****',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            letterSpacing: 2,
                            shadows: [
                              Shadow(
                                  color: Colors.black45,
                                  offset: Offset(1,2),
                                  blurRadius: 2
                              ),
                            ]
                        ),
                      ),
                      Text(
                        '****',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            letterSpacing: 2,
                            shadows: [
                              Shadow(
                                  color: Colors.black45,
                                  offset: Offset(1,2),
                                  blurRadius: 2
                              ),
                            ]
                        ),
                      ),
                      Text(
                        widget.card.pin,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            shadows: [
                              Shadow(
                                  color: Colors.black45,
                                  offset: Offset(1,2),
                                  blurRadius: 2
                              ),
                            ]
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'CARD HOLDER',
                            style: TextStyle(
                                fontSize: 8,
                                color: Colors.white,
                                letterSpacing: 1.5
                            ),
                          ),
                          Text(
                            widget.card.holder,
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                      color: Colors.black45,
                                      offset: Offset(1,2),
                                      blurRadius: 2
                                  ),
                                ]
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            'EXPIRES',
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 8
                            ),
                          ),
                          Text(
                            widget.card.expires,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'WorkSans',
                                shadows: [
                                  Shadow(
                                      color: Colors.black45,
                                      offset: Offset(1,2),
                                      blurRadius: 2
                                  ),
                                ]
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 32),
              child: Text(
                'Services',
                style: kTextStyle(16, FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildServices(
                      text: 'Send',
                      image: Image.asset('assets/images/ic_send.png'),
                      color: Color(0xFFE8EFFC)
                  ),
                  _buildServices(
                      text: 'Request',
                      image: Image.asset('assets/images/ic_receive.png'),
                      color: Color(0xFFE7F6F3)
                  ),
                  _buildServices(
                      text: 'Recharge',
                      image: Image.asset('assets/images/ic_recharge.png'),
                      color: Color(0xFFFAEBEE)
                  ),
                  _buildServices(
                      text: 'Payment',
                      image: Image.asset('assets/images/ic_pay.png'),
                      color: Color(0xFFEAECFF)
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Offers',
                    style: kTextStyle(16, FontWeight.w600),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    size: 20,
                    color: kColorFont,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 145,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(right: 20),
                children: <Widget>[
                  _buildCard(image: 'assets/images/img_offers_1.png'),
                  _buildCard(image: 'assets/images/img_offers_2.png'),
                  _buildCard(image: 'assets/images/img_offers_1.png'),
                  _buildCard(image: 'assets/images/img_offers_2.png'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Shopping',
                    style: kTextStyle(16, FontWeight.w600),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    size: 20,
                    color: kColorFont,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 145,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(right: 20),
                children: <Widget>[
                  _buildCard(image: 'assets/images/img_shops_1.png'),
                  _buildCard(image: 'assets/images/img_shops_2.png'),
                  _buildCard(image: 'assets/images/img_shops_1.png'),
                  _buildCard(image: 'assets/images/img_shops_2.png'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

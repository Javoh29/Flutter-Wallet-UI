import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterui/models/wallet_model.dart';
import 'package:flutterui/screens/card_screen.dart';
import 'package:flutterui/screens/transaction_screen.dart';
import 'package:flutterui/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.9);
  }

  _cardPages(int index){
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, widget){
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.25)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 210.0,
            width: Curves.easeInOut.transform(value) * MediaQuery.of(context).size.width,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => CardScreen(card: cards[index],)
          ));
        },
        child: Container(
          transform: Matrix4.translationValues(0.0, -10.0, 0.0),
          margin: EdgeInsets.symmetric(horizontal: 5),
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          decoration: BoxDecoration(
            gradient: cards[index].linearGradient,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 12),
                  blurRadius: 35
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Balance',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 8,
                          letterSpacing: 1.5
                        ),
                      ),
                      Text(
                        '\$${cards[index].balance}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: cards[index].size,
                    child: Image(
                      image: AssetImage(cards[index].logo),
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
                      fontSize: 22,
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
                      fontSize: 22,
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
                      fontSize: 22,
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
                    cards[index].pin,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
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
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'CARD HOLDER',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 8
                          ),
                        ),
                        Text(
                          cards[index].holder,
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
                          cards[index].expires,
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
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTransactions(int index){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => TransactionScreen(linearGradient: cards[_pageController.page.toInt()].linearGradient,),
        ));
      },
      child: Container(
        height: 100,
        margin: EdgeInsets.only(bottom: 2),
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
        ),
        child: ListTile(
          leading: Container(
            height: 60,
            width: 60,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: trans[index].color,
              shape: BoxShape.circle
            ),
            child: Image.asset(trans[index].icUrl),
          ),
          title: Text(
            trans[index].name,
            style: kTextStyle(18, FontWeight.w600),
          ),
          subtitle: Text(
            trans[index].pay,
            style: kTextStyle(13, null),
          ),
          trailing: Padding(
            padding: EdgeInsets.only(right: 10),
            child: Text(
              trans[index].price,
              style: TextStyle(
                color: kColorFontMoney,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark,);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.arrow_back_ios,
                      color: kColorFont,
                      size: 20,
                    ),
                    Text(
                      'Your Wallet',
                      style: kTextStyle(24, FontWeight.bold)
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
              ),
              Container(
                height: 310,
                width: double.infinity,
                child: PageView.builder(
                    controller: _pageController,
                    itemCount: cards.length,
                    itemBuilder: (context, index){
                      return _cardPages(index);
                    }
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Transactions',
                      style: kTextStyle(18, FontWeight.w600),
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
                height: MediaQuery.of(context).size.height/2,
                child: ListView.builder(
                    itemCount: trans.length,
                    itemBuilder: (context, index){
                      return _buildTransactions(index);
                    }
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}

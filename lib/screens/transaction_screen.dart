import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterui/models/wallet_model.dart';
import 'package:flutterui/utils/constants.dart';

class TransactionScreen extends StatefulWidget {

  final LinearGradient linearGradient;

  TransactionScreen({this.linearGradient});

  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {

  Widget _buildTransactions(int index){
    return Container(
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
              height: 250,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
              decoration: BoxDecoration(
                  gradient: widget.linearGradient,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                          'Transactions',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Spacer(),
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
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Icon(
                        Icons.arrow_downward,
                        size: 30,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Income',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              letterSpacing: 1.5
                            ),
                          ),
                          Text(
                            '\$45,345',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_upward,
                        size: 30,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Expense',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                letterSpacing: 1.5
                            ),
                          ),
                          Text(
                            '\$536',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),

                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Text(
                'In this week',
                style: kTextStyle(16, FontWeight.w600),
              ),
            ),
            Container(
              height: 300,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 30,),
              alignment: Alignment.center,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 220,
                    width: 12,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5)
                    ),
                  ),
                  Container(
                    height: 70,
                    width: 12,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5)
                    ),
                  ),
                  Container(
                    height: 145,
                    width: 12,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5)
                    ),
                  ),
                  Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Container(
                        height: 160,
                        width: 12,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(5)
                        ),
                      ),
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                            gradient: widget.linearGradient,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.white,
                                width: 3
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 8
                              )
                            ]
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 70,
                        alignment: Alignment.center,
                        transform: Matrix4.translationValues(0, -50, 0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '+ \$867',
                          style: TextStyle(
                              color: kColorFontMoney,
                              fontSize: 12,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 100,
                    width: 12,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5)
                    ),
                  ),
                  Container(
                    height: 75,
                    width: 12,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5)
                    ),
                  ),
                  Container(
                    height: 45,
                    width: 12,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5)
                    ),
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
    );
  }
}

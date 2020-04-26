import 'package:flutter/material.dart';
import 'package:flutterui/models/palyer_model.dart';
import 'package:flutterui/screens/player_screen.dart';
import 'package:flutterui/widgets/decorations.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  List<String> tabs = [
    'Music',
    'Podcast',
    'Radio'
  ];

  Widget _buildTopPanel(){
    return Padding(
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
    );
  }

  Widget _buildSearchPanel(){
    return Container(
        height: 42,
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 15),
        alignment: Alignment.center,
        decoration: ConcaveDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
            ),
            colors: [Colors.grey[400], Colors.white70],
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
    );
  }

  int onTab = 1;

  Widget _buildTabPanel(int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          onTab = index;
        });
      },
      child: Container(
        height: 35,
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.symmetric(horizontal: 15),
        alignment: Alignment.center,
        decoration: onTab == index ? ConcaveDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
            ),
            colors: [Colors.grey[400], Colors.white70],
            depression: 5
        ) : null,
        child: Text(
          tabs[index],
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontSize: 14,
            fontFamily: 'WorkSans',
            fontWeight: FontWeight.w600
          ),
        ),
      ),
    );
  }

  Widget _buildPlayedPanel(int index){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (_) => PlayerScreen()
        ));
      },
      child: Container(
        height: 175,
        width: 120,
        margin: EdgeInsets.fromLTRB(0, 10, 15, 10),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(15),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 100,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(13),
                  topRight: Radius.circular(13),
                  bottomRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                ),
                child: Image(
                  image: AssetImage(played[index].imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                played[index].name,
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 14,
                  fontFamily: 'WorkSans',
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            Text(
              played[index].text,
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 12,
                  fontFamily: 'WorkSans',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayList(int index){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (_) => PlayerScreen()
        ));
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 20, right: 15, left: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 40,
                  width: 40,
                  padding: EdgeInsets.all(3),
                  margin: EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).primaryColor,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          offset: -Offset(2, 2),
                          color: Colors.white,
                        ),
                        BoxShadow(
                          blurRadius: 5,
                          offset: Offset(2, 2),
                          color: Colors.grey[400],
                        )
                      ]
                  ),
                  child: ClipOval(
                    child: Image(
                      image: AssetImage(playList[index].imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      playList[index].name,
                      style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).accentColor,
                          fontFamily: 'WorkSans',
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    Text(
                      playList[index].text,
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).accentColor,
                        fontFamily: 'WorkSans',
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Text(
                    '${playList[index].eps} Eps',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 14,
                      fontFamily: 'WorkSans',

                    ),
                  ),
                ),
                Icon(
                  Icons.more_vert,
                  color: Theme.of(context).accentColor,
                  size: 20,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  int bottomSheet = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: <Widget>[
                _buildTopPanel(),
                _buildSearchPanel(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: SizedBox(
                    height: 40,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: tabs.length,
                        itemBuilder: (context, index){
                          return _buildTabPanel(index);
                        }
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Recently Played',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).accentColor,
                      fontFamily: 'WorkSans',
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                SizedBox(
                  height: 195,
                  child: ListView.builder(
                      padding: EdgeInsets.only(left: 20),
                      scrollDirection: Axis.horizontal,
                      itemCount: played.length,
                      itemBuilder: (context, index){
                        return _buildPlayedPanel(index);
                      }
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Top Podcasts',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 16,
                      fontFamily: 'WorkSans',
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height/3,
                  child: ListView.builder(
                      padding: EdgeInsets.only(left: 5),
                      itemCount: playList.length,
                      itemBuilder: (context, index){
                        return _buildPlayList(index);
                      }
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        height: 65,
        padding: EdgeInsets.symmetric(horizontal: 30),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              offset: -Offset(0, 4),
              color: Colors.white,
            ),
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: (){
                setState(() {
                  bottomSheet = 0;
                });
              },
              child: Container(
                height: 45,
                width: 60,
                decoration: bottomSheet != 0 ? BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).primaryColor,
                  boxShadow:[
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
                ) : ConcaveDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    colors: [Colors.grey[400], Colors.white70],
                    depression: 5
                ),
                child: Icon(
                  Icons.home,
                  color: Theme.of(context).accentColor,
                  size: 25,
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  bottomSheet = 1;
                });
              },
              child: Container(
                height: 45,
                width: 60,
                decoration: bottomSheet != 1 ? BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).primaryColor,
                    boxShadow:[
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
                ) : ConcaveDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    colors: [Colors.grey[400], Colors.white70],
                    depression: 5
                ),
                child: Icon(
                  Icons.folder,
                  color: Theme.of(context).accentColor,
                  size: 25,
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  bottomSheet = 2;
                });
              },
              child: Container(
                height: 45,
                width: 60,
                decoration: bottomSheet != 2 ? BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).primaryColor,
                    boxShadow:[
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
                ) : ConcaveDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    colors: [Colors.grey[400], Colors.white70],
                    depression: 5
                ),
                child: Icon(
                  Icons.headset,
                  color: Theme.of(context).accentColor,
                  size: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

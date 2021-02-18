import 'package:flutter/material.dart';

class aboutPage extends StatelessWidget {
  static String tag = 'about-page';

  @override
  Widget build(BuildContext context) {
    final card = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          //backgroundImage: ,
        ),
      ),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'News App CopyRight by:',
        style: TextStyle(
            fontSize: 28.0,
            color: Colors.white),
      ),
    );

    final text1 = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Amelia Hermawanti 18111012',
        style: TextStyle(
            fontSize: 16.0,
            color: Colors.white
        ),
      ),
    );
    final text2 = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Arni Jamaliyah 18111025',
        style: TextStyle(
            fontSize: 16.0,
            color: Colors.white
        ),
      ),
    );
    final text3 = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Nindi Irsani 18111219',
        style: TextStyle(
            fontSize: 16.0,
            color: Colors.white
        ),
      ),
    );
    final text4 = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'RD Triawan Subagia S 18111132',
        style: TextStyle(
            fontSize: 16.0,
            color: Colors.white
        ),
      ),
    );
    final body= Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.purple,
          Colors.purpleAccent,
        ]),
      ),
      child: Column(
        children: <Widget>[card,welcome,text1,text2,text3,text4],
      ),
    );

    return Scaffold(
      body: body,
    );
  }

}

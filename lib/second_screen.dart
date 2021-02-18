import 'dart:convert';
import 'package:newsapp/aboutus.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:newsapp/detailspage.dart';
import 'package:newsapp/profile.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondScreen extends StatefulWidget {
  var idUser,username,firstname,lastname;
  SecondScreen({Key key, this.idUser,this.firstname,this.lastname,this.username}) : super(key: key);

  SecondPageState createState() => SecondPageState();

}

class SecondPageState extends State<SecondScreen> {

  _launchURL() async {
    const url = 'tel:081462358062';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not make Call';
    }
  }

  @override
  void initState() {
    super.initState();
    getdata();
  }

  List data;
  void getdata() async {
    String url =
        'https://flutternewsapp.000webhostapp.com/articles.php';
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var decodedjson = jsonDecode(response.body);
      setState(() {
        data = decodedjson["articles"];
      });
    } else {
      print(response.statusCode);
    }
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("News App"),
      ),
      drawer: new Drawer(
          child: new ListView(
        children: <Widget>[
          new DrawerHeader(
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: Row(
                    children: <Widget>[
                      new Container(
                        width: 70.0,
                        height: 70.0,
                        child: new CircleAvatar(
                          minRadius: 50.0,
                          backgroundColor: Colors.blue.shade50,
                          child: new Text(widget.firstname),
                        ),
                      ),
                      new Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: new Column(
                          children: <Widget>[
                            Text("User Name : ${widget.username}"),
                            Text("First Name : ${widget.firstname}"),
                            Text("Last Name : ${widget.lastname}"),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          new ListTile(
            title: new Text('Your Profile'),
            onTap: () {
              var route = new MaterialPageRoute(
                builder: (BuildContext context) =>
                new Profile(idUser: widget.idUser),
              );
              Navigator.of(context).push(route);
            },
          ),
          new ListTile(
            title: new Text('Call Customer Service'),
            onTap: () {
              _launchURL();
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text('About Us'),
            onTap: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => aboutPage()),);
            },
          ),
        ],
      )),
      body: new Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Row(
                  //mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Sports',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Fitness',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Technology',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Buisness',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(
                          author: data[index]["author"],
                          content: data[index]["content"],
                          description: data[index]["description"],
                          publishdate: data[index]["publishedAt"],
                          title: data[index]["title"],
                          url: data[index]["url"],
                          urltoimage: data[index]["urlToImage"],
                        ),
                      ),
                    );
                  },
                  child: Stack(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35.0),
                          topRight: Radius.circular(35.0),
                        ),
                        child: Image.network(
                          data[index]["urlToImage"],
                          fit: BoxFit.cover,
                          height: 240,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 240.0, 0.0, 0.0),
                        child: Container(
                          height: 120,
                          width: 300,
                          child: Material(
                            borderRadius: BorderRadiusDirectional.only(
                              bottomEnd: Radius.circular(35.0),
                              bottomStart: Radius.circular(35.0),
                            ),
                            elevation: 20,
                            child: Center(
                              child: Text(
                                data[index]["title"],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: 10,
              viewportFraction: 0.8,
              scale: 0.9,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(
                Icons.home,
                semanticLabel: 'Home',
                size: 40,
              ),
              CircleAvatar(
                  backgroundColor: Colors.purple,
                  child: InkWell(
                    child: new Text(widget.firstname),
                    onTap: () {
                      var route = new MaterialPageRoute(
                        builder: (BuildContext context) =>
                        new Profile(idUser: widget.idUser),
                      );
                      Navigator.of(context).push(route);
                    },
                  )

              ),

            ],
          )
        ],
      )
    );
  }
}

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var searchIcon = Icon(Icons.search, color: Colors.white);
  var searchIconState = 0;
  Widget appBarTitle = Text('Weather');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarTitle,
        actions: <Widget>[
          Builder(
            builder: (context) =>
                IconButton(
                  icon: searchIcon,
                  onPressed: () {
                    search(context);
                  },
                ),
          )
        ],
      ),
      body: Center(
        child: Text(''),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(''),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.my_location),
              title: Text('My location'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  search(BuildContext context) {
    searchIconState++;
    //Scaffold.of(context).showSnackBar(SnackBar(content: Text("Show search bar")));
    setState(() {
      if (searchIconState % 2 != 0) {
        searchIcon = Icon(Icons.close, color: Colors.white);
        appBarTitle = TextField(
            style: TextStyle(color: Colors.white, fontSize: 18),
            decoration: InputDecoration(
                border: InputBorder.none,
                icon: Icon(Icons.search, color: Colors.white),
                hintText: 'Search...',
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  //fontWeight: FontWeight.bold,
                  fontSize: 18
                )
            )
        );
      }
      else {
        searchIcon = Icon(Icons.search, color:Colors.white);
        appBarTitle = Text('Weather');
      }
    });
  }
}

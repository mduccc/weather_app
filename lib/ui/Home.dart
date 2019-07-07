import 'package:flutter/material.dart';
import 'package:weather_app/business/provider/DatabaseProvider.dart';
import 'package:weather_app/model/WeatherCurrent.dart';
import 'package:weather_app/ui/Week.dart';

import 'Search.dart';
import 'Today.dart';
import 'Week.dart';

var primarySwatch = Colors.deepPurple;

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      theme: ThemeData(
        primarySwatch: primarySwatch,
      ),
      home: HomePage(title: ''),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  IconButton _locationIcon;
  Widget _appBarTitle;
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();
  WeatherCurrent weatherCurrent = null;

  var _tab = <Widget>[
    Today(),
    Week(),
  ];

  _onChange() {}

  _onFocusNode() {}

  @override
  void initState() {
    super.initState();

    _locationIcon = IconButton(
        icon: Icon(Icons.my_location, color: Colors.white), onPressed: () {});

    _appBarTitle = TextField(
        controller: _controller,
        focusNode: _focusNode,
        onTap: () async {
          _controller.clear();
          _focusNode.unfocus();

          // Open new Screen
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Search()),
          );

          if (result != null && result == "Seted") {
            setState(() {
              _tab = <Widget>[
                Today(),
                Week(),
              ];
            });
          }
        },
        style: TextStyle(color: Colors.white, fontSize: 18),
        textInputAction: TextInputAction.done,
        textCapitalization: TextCapitalization.sentences,
        cursorColor: Colors.white,
        cursorRadius: Radius.circular(16.0),
        maxLines: 1,
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: null),
            hintText: 'Search...',
            hintStyle:
                TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 18)));

    _controller.addListener(_onChange);
    _focusNode.addListener(_onFocusNode);
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    // This also removes the _printLatestValue listener
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  _nestedScrollViewController() {}

  _tabBarController() {}

  // onBackPress
  Future<bool> _onWillPopScope() {
    return Future(() => true);
  }

  @override
  Widget build(BuildContext context) {
    // Create Database
    DatabaseProvider().create();

    return WillPopScope(
      onWillPop: _onWillPopScope,
      child: DefaultTabController(
        length: _tab.length,
        child: NestedScrollView(
            controller: _nestedScrollViewController(),
            headerSliverBuilder: (BuildContext context, bool isScrolled) {
              return <Widget>[
                SliverAppBar(
                  title: _appBarTitle,
                  actions: <Widget>[
                    Builder(
                      builder: (context) => IconButton(
                            icon: _locationIcon,
                            onPressed: () {},
                          ),
                    )
                  ],
                  pinned: true,
                  floating: true,
                  forceElevated: isScrolled,
                  bottom: TabBar(
                    tabs: <Widget>[Tab(text: 'CURRENT'), Tab(text: 'DAYS')],
                    controller: _tabBarController(),
                  ),
                )
              ];
            },
            body: GestureDetector(
              onTap: () {},
              child: Scaffold(
                body: TabBarView(
                  children: _tab,
                ),
              ),
            )),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'today.dart';
import 'tomorrow.dart';
import 'week.dart';

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
  Icon _searchIcon = Icon(Icons.search, color: Colors.white);
  IconButton _locationIcon;
  IconButton _iconClear;
  Widget _appBarTitle;
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();

  _onChange() {
    print(_controller.text);
  }

  _onFocusNode() {
  }

  @override
  void initState() {
    super.initState();

    _iconClear = IconButton(icon: Icon(Icons.clear, color: Colors.white.withOpacity(0.5)), onPressed: () {
      _controller.clear();
    });

    _locationIcon = IconButton(icon: Icon(Icons.my_location, color: Colors.white), onPressed: () {
    });

    _appBarTitle = TextField(
        controller: _controller,
        focusNode: _focusNode,
        onSubmitted: (_) {
        },
        style: TextStyle(color: Colors.white, fontSize: 18),
        textInputAction: TextInputAction.done,
        textCapitalization: TextCapitalization.sentences,
        cursorColor: Colors.white,
        cursorRadius: Radius.circular(16.0),
        maxLines: 1,
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: _searchIcon,
            suffixIcon: _iconClear,
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
    return WillPopScope(
      onWillPop: _onWillPopScope,
      child: DefaultTabController(
        length: 3,
        child: NestedScrollView(
            controller: _nestedScrollViewController(),
            headerSliverBuilder: (BuildContext context, bool isScrolled) {
              return <Widget>[
                SliverAppBar(
                  title: _appBarTitle,
                  actions: <Widget>[
                    Builder(
                      builder: (context) =>
                          IconButton(
                            icon: _locationIcon,
                            onPressed: () {
                              print('haha');
                            },
                          ),
                    )
                  ],
                  pinned: true,
                  floating: true,
                  forceElevated: isScrolled,
                  bottom: TabBar(
                    tabs: <Widget>[
                      Tab(text: 'TODAY'),
                      Tab(text: 'TOMORROW'),
                      Tab(text: 'WEEK')
                    ],
                    controller: _tabBarController(),
                  ),
                )
              ];
            },
            body: GestureDetector(
              onTap: () {
                _closeSearch();
              },
              child: Scaffold(
                body: TabBarView(
                  children: <Widget>[
                    todayUI(),
                    tomorrowUI(),
                    weekUI(),
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }

  _closeSearch() {
    _controller.clear();
    _focusNode.unfocus();
  }

  _search() {
    //Scaffold.of(context).showSnackBar(SnackBar(content: Text("Show search bar")));
    setState(() {
      _controller.text = '';
    });
  }
}

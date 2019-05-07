import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../collection/Locations.dart';
import '../model/searchLocation.dart';
import 'home.dart';

class Search extends StatelessWidget {

  var primarySwatch = Colors.deepPurple;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      theme: ThemeData(
        primarySwatch: primarySwatch,
      ),
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  Icon _searchIcon = Icon(Icons.search, color: Colors.white);
  IconButton _iconClear;
  Widget _appBarTitle;
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();
  Future<Locations> _searchResult;
  SearchLocation searchLocation;

  _onChange() {
    print(_controller.text);
  }

  _onFocusNode() {
  }

  @override
  void initState() {
    super.initState();

    _iconClear = IconButton(
        icon: Icon(Icons.clear, color: Colors.white.withOpacity(0.5)),
        onPressed: () {
          _controller.clear();
        });

    _appBarTitle = TextField(
        controller: _controller,
        focusNode: _focusNode,
        autofocus: true,
        onSubmitted: (_) {
          _search();
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
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: _appBarTitle,
      ),
      body: Container(
          child: Center(
            child: FutureBuilder<Locations>(
                future: _searchResult,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    print(snapshot.error);
                  }
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data.result.length,
                        itemBuilder: (context, index) {
                          return Material(
                            elevation: 5,
                            child: InkWell(
                              onTap: (){
                                print('Clicked to ' + snapshot.data.result[index].name);
                                // Open new Activity
                                Navigator.canPop(context);
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                color: Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(snapshot.data.result[index].name),
                                    Text('Country: ' + snapshot.data.result[index].country)
                                  ],
                                ),
                              ),
                            )
                          );
                        });
                  }
                  else {
                    print('Location: No Result');
                    return Text('No result');
                  }
                  return CircularProgressIndicator();
                }),
          )
      ),
    );
  }

  _search() {
    setState(() {
      SearchLocation searchLocation = SearchLocation();
      _searchResult = searchLocation.search(_controller.text);
    });
  }


}
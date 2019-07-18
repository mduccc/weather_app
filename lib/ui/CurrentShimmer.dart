import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CurrentShimmer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyCurrentShimmerState();
  }
}

class _MyCurrentShimmerState extends State<CurrentShimmer> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: 200,
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 10,
                        color: Colors.grey[300],
                        margin: EdgeInsets.all(5),
                      ),
                      Container(
                        height: 10,
                        color: Colors.grey[300],
                        margin: EdgeInsets.all(5),
                      ),
                      Container(
                        height: 10,
                        color: Colors.grey[300],
                        margin: EdgeInsets.all(5),
                      ),
                      Container(
                        height: 10,
                        color: Colors.grey[300],
                        margin: EdgeInsets.all(5),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 50,
                        width: 50,
                        color: Colors.grey[300],
                        margin: EdgeInsets.all(5),
                      ),
                      Container(
                        height: 5,
                        width: 60,
                        color: Colors.grey[300],
                        margin: EdgeInsets.all(2),
                      ),
                      Container(
                        height: 5,
                        width: 60,
                        color: Colors.grey[300],
                        margin: EdgeInsets.all(2),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Center(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 40,
                  color: Colors.grey[300],
                  margin: EdgeInsets.all(20),
                ),
                Container(
                  height: 40,
                  width: 40,
                  color: Colors.grey[300],
                  margin: EdgeInsets.all(20),
                ),
                Container(
                  height: 40,
                  width: 40,
                  color: Colors.grey,
                  margin: EdgeInsets.all(20),
                ),
                Container(
                  height: 40,
                  width: 40,
                  color: Colors.grey,
                  margin: EdgeInsets.all(20),
                ),
              ],
            )
          ],
        ));
  }
}

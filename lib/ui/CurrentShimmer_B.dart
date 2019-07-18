import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CurrentShimmer_B extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyCurrentShimmerBState();
  }
}

class _MyCurrentShimmerBState extends State<CurrentShimmer_B> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Shimmer.fromColors(
      highlightColor: Colors.white,
      baseColor: Colors.grey[400],
      child: _ShimmerLayout(),
    );
  }
}

class _ShimmerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: 200,
        //padding: EdgeInsets.only(left: 10, right: 10, top: 20),
        child: Column(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 5,
                  color: Colors.grey[400],
                  margin: EdgeInsets.only(left: 5, right: 5),
                ),
                SizedBox(
                  height: 3,
                ),
                Container(
                  height: 5,
                  color: Colors.grey[400],
                  margin: EdgeInsets.only(left: 5, right: 5),
                ),
                SizedBox(
                  height: 3,
                ),
                Container(
                  height: 5,
                  color: Colors.grey,
                  margin: EdgeInsets.only(left: 5, right: 5),
                ),
                SizedBox(
                  height: 3,
                ),
                Container(
                  height: 5,
                  color: Colors.grey,
                  margin: EdgeInsets.only(left: 5, right: 5),
                ),
              ],
            )
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DaystShimmer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyDaysShimmerState();
  }
}

class _MyDaysShimmerState extends State<DaystShimmer> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            highlightColor: Colors.white,
            baseColor: Colors.grey[400],
            child: ShimmerLayout(),
          );
        },
      ),
    );
  }

  _layout() {
    return Card(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
              color: Colors.grey,
            ),
            SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
  }
}

class ShimmerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7.5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 5,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Container(
                      height: 5,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Container(
                      height: 5,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Container(
                      height: 5,
                      color: Colors.grey,
                    ),
                  ],
                ),
              )),
          Expanded(
            flex: 1,
            child: Container(margin: EdgeInsets.all(5),height: 50, color: Colors.grey),
          )
        ],
      ),
    );
  }
}

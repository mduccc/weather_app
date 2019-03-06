import 'package:flutter/material.dart';
import 'renderHtmlCharacter.dart';

todayUI() {
  var list = List<String>();
  int index = 0;

  while (index < 24) {
    list.add(index.toString());
    index++;
  }

  return Container(
      color: Colors.deepPurple,
      margin: EdgeInsets.all(0) /* margin */,
      padding: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween /*weight center*/,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start /*align: left*/,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(bottom: 15, left: 0),
                      child: Text('March 5, 20:00',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
                  Container(
                    margin: EdgeInsets.only(bottom: 5, left: 0),
                    child: Text(
                        'Day 23' +
                            htmlDecode('&#176;') +
                            ', Night 19' +
                            htmlDecode('&#176;'),
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                  Container(
                      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        child: Text('20',
                            style:
                                TextStyle(fontSize: 70, color: Colors.white)),
                      ),
                      Container(
                          padding: new EdgeInsets.only(top: 12),
                          child: Text(htmlDecode('&#176;') + 'C',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)))
                    ],
                  )),
                  Container(
                    child: Text(
                      'Feels like 20' + htmlDecode('&#176;') + 'C',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center /*align: right*/,
                children: <Widget>[
                  Container(
                      child: Icon(Icons.cloud, size: 100, color: Colors.white)),
                  Container(
                      child: Text(
                    'Cloud',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ))
                ],
              ),
            ],
          ),
          Container(
              margin: EdgeInsets.only(top: 90),
              height: 120,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: list.length == 0 ? 0 : list.length,
                  itemBuilder: (BuildContext _context, int _index) {
                    return Container(
                        padding: EdgeInsets.all(17),
                        width: 80,
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Text(
                                _index.toString() + ":00",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 3),
                              child: Icon(Icons.cloud,
                                  size: 23, color: Colors.white),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5, top: 15),
                              child: Text(
                                _index.toString() + htmlDecode('&#176;') + 'C',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            )
                          ],
                        ));
                  })),
        ],
      ));
}

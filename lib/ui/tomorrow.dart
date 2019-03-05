import 'package:flutter/material.dart';
import 'renderHtmlCharacter.dart';

tomorrowUI() {
  return Container(
      color: Colors.yellow,
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
                      child: Text('March 5',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold))),
                  Container(
                    margin: EdgeInsets.only(bottom: 5, left: 0),
                    child: Text(
                        'Day 29' +
                            htmlDecode('&#176;') +
                            ', Night 24' +
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
                            child: Text('26',
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
                      'Feels like 26' + htmlDecode('&#176;') + 'C',
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
                      child: Icon(Icons.wb_sunny, size: 100, color: Colors.white)),
                  Container(
                      child: Text(
                        'Sunny',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ))
                ],
              ),
            ],
          ),
        ],
      ));
}

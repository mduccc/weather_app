import 'package:flutter/material.dart';
import 'package:weather_app/business/provider/WeatherProvider.dart';
import 'package:weather_app/model/ForecastDaily.dart';
import 'package:weather_app/model/WeatherCurrent.dart';
import 'RenderHtmlCharacter.dart';

class Today extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyTodayState();
  }
}

// AutomaticKeepAliveClientMixin: keep state after switch tab
class _MyTodayState extends State<Today> with AutomaticKeepAliveClientMixin {
  WeatherProvider _weatherProvider = WeatherProvider();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.deepPurple,
      child: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.all(0) /* margin */,
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Container(
                  child: FutureBuilder<WeatherCurrent>(
                      future: _weatherProvider.current(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasError) {
                          if (snapshot.hasData) {
                            WeatherCurrent weatherCurrent = snapshot.data;

                            return Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.start /*weight center*/,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start /*align: left*/,
                                    children: <Widget>[
                                      Container(
                                          child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Container(
                                            child: Text(
                                                weatherCurrent.main.temp
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 60,
                                                    color: Colors.white)),
                                          ),
                                          Container(
                                              padding:
                                                  new EdgeInsets.only(top: 12),
                                              child: Text(
                                                  htmlDecode('&#176;') + 'C',
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold)))
                                        ],
                                      )),
                                      Container(
                                          child: Text(
                                        weatherCurrent.main.temp_min
                                                .toString() +
                                            ' - ' +
                                            weatherCurrent.main.temp_max
                                                .toString() +
                                            htmlDecode('&#176;') +
                                            'C',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      Container(
                                          margin: EdgeInsets.only(
                                              bottom: 15, left: 0),
                                          child: Text(
                                              weatherCurrent.name +
                                                  ', ' +
                                                  weatherCurrent.sys.country,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      Container(
                                        child: Text(
                                          'Feels like ' +
                                              weatherCurrent.main.temp
                                                  .toString() +
                                              ' ' +
                                              htmlDecode('&#176;') +
                                              'C and Humidity ' +
                                              weatherCurrent.main.humidity
                                                  .toString() +
                                              '%',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontStyle: FontStyle.italic),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        child: Image.network(
                                          'http://openweathermap.org/img/w/' +
                                              weatherCurrent.weather[0].icon +
                                              '.png',
                                          width: 70,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Container(
                                          child: Text(
                                        weatherCurrent.weather[0].main
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      )),
                                      Container(
                                          child: Text(
                                        '(' +
                                            weatherCurrent
                                                .weather[0].description
                                                .toString() +
                                            ')',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ))
                                    ],
                                  ),
                                ),
                              ],
                            );
                          } else
                            print('No current weather data');
                        } else
                          print(snapshot.error);
                        return Text('');
                      }),
                ),
                Container(
                  height: 100,
                  color: Colors.deepPurple,
                  margin: EdgeInsets.only(top: 20),
                  child: FutureBuilder<ForecastDaily>(
                    future: _weatherProvider.forceDaily(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasError) {
                        if (snapshot.hasData) {
                          ForecastDaily forecastDaily = snapshot.data;
                          return Container(
                              margin: EdgeInsets.only(top: 0),
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: forecastDaily.list.length == 0
                                      ? 0
                                      : forecastDaily.list.length,
                                  itemBuilder:
                                      (BuildContext _context, int _index) {
                                    String date =
                                        forecastDaily.list[_index].dt_txt;
                                    date = date.substring(
                                        date.indexOf('-') + 1, date.length);
                                    date = date.substring(
                                        0, date.lastIndexOf(':'));

                                    String date_time = date
                                        .substring(0, date.indexOf(' '))
                                        .replaceAll('-', '/');
                                    String time = date.substring(
                                        date.indexOf(' ') + 1, date.length);

                                    String month = date_time.substring(
                                        0, date_time.indexOf('/'));
                                    String day = date_time.substring(
                                        date_time.indexOf('/') + 1,
                                        date_time.length);
                                    date_time = '$day/$month';

                                    return Container(
                                        width: 100,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              child: Text(
                                                time,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                '(' + date_time + ')',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10,
                                                    fontStyle:
                                                        FontStyle.italic),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 0),
                                              child: Image.network(
                                                'http://openweathermap.org/img/w/' +
                                                    forecastDaily.list[_index]
                                                        .weather[0].icon +
                                                    '.png',
                                                width: 30,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 5, top: 0),
                                              child: Text(
                                                forecastDaily
                                                        .list[_index].main.temp
                                                        .toString() +
                                                    htmlDecode('&#176;') +
                                                    'C',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12),
                                              ),
                                            )
                                          ],
                                        ));
                                  }));
                        } else {
                          print('No forecast data ');
                        }
                      } else {
                        print(snapshot.error);
                      }
                      return Text('');
                    },
                  ),
                )
              ],
            )),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

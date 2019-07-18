import 'package:flutter/material.dart';
import 'package:weather_app/business/provider/WeatherProvider.dart';
import 'package:weather_app/model/ForecastDaily.dart';
import 'package:weather_app/ui/DaysShimmer.dart';

import 'RenderHtmlCharacter.dart';

class Week extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyWeekState();
  }
}

// AutomaticKeepAliveClientMixin: keep state after switch tab
class _MyWeekState extends State<Week> with AutomaticKeepAliveClientMixin {
  WeatherProvider _weatherProvider = WeatherProvider();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        padding: EdgeInsets.all(5),
        color: Colors.deepPurple,
        child: FutureBuilder<ForecastDaily>(
          future: _weatherProvider.forceDaily(),
          builder: (context, snapshot) {
            if (!snapshot.hasError) {
              if (snapshot.hasData) {
                ForecastDaily forecastDaily = snapshot.data;
                return _mainUI(forecastDaily);
              }
            }
            return DaystShimmer();
          },
        ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  _mainUI(ForecastDaily forecastDaily) {
    return Container(
        child: ListView.builder(
      itemCount: forecastDaily.list.length,
      itemBuilder: (context, index) {
        String date = forecastDaily.list[index].dt_txt;
        date = date.substring(date.indexOf('-') + 1, date.length);
        date = date.substring(0, date.lastIndexOf(':'));

        String date_time =
            date.substring(0, date.indexOf(' ')).replaceAll('-', '/');
        String time = date.substring(date.indexOf(' ') + 1, date.length);

        String month = date_time.substring(0, date_time.indexOf('/'));
        String day =
            date_time.substring(date_time.indexOf('/') + 1, date_time.length);
        date_time = '$day/$month';

        return Card(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        date_time,
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        time +
                            ', ' +
                            forecastDaily.list[index].main.temp.toString() +
                            ' ' +
                            htmlDecode('&#176;') +
                            'C',
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 14,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        forecastDaily.list[index].main.temp_min.toString() +
                            ' - ' +
                            forecastDaily.list[index].main.temp_max.toString() +
                            htmlDecode('&#176;') +
                            'C',
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 15,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        'Humidity ' +
                            forecastDaily.list[index].main.humidity.toString() +
                            '%',
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 15,
                            fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Image.network(
                        'http://openweathermap.org/img/w/' +
                            forecastDaily.list[index].weather[0].icon +
                            '.png',
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                      Text(forecastDaily.list[index].weather[0].main,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      Text(
                          '(' +
                              forecastDaily.list[index].weather[0].description +
                              ')',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal))
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    ));
  }
}

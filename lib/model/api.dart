class Api {
  String key = 'b80c043c37f60763eb9d74989bca7554';

  String current(id, unit) {
    return 'http://api.openweathermap.org/data/2.5/weather?id='+id+'&units='+unit+'&appid='+this.key;
  }

  String forecast(id, unit) {
    return 'http://api.openweathermap.org/data/2.5/forecast?id='+id+'&units='+unit+'&appid='+this.key;
  }

  String searchLocation(key_word) {
    return 'https://location-query.herokuapp.com/location?key_word='+key_word;
  }
}
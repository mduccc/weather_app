import 'dart:async';
import 'dart:convert';
import 'api.dart';
import 'package:http/http.dart' as http;
import '../collection/Locations.dart';

class SearchLocation {

  Future<Locations> search(key_word) async {
    final get = await http.get(Api().searchLocation(key_word));
    if (get.statusCode == 200)
      return Locations.fromJson(json.decode(get.body));
    else
      throw Exception('Can not request');
  }

}
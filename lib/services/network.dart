import 'dart:convert';

import 'package:http/http.dart' as http;

class NetWorkHelper {
  final String? url;
  NetWorkHelper({this.url});
  Future getWeather() async {
    http.Response response = await http.get(Uri.parse(url!));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;

class NetWorkHelper {
  final String url;

  NetWorkHelper(
    this.url,
  );
  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
      var lon = jsonDecode(data)['coord']['lon'];
      print(lon);
    } else {
      print(response.statusCode);
    }
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;

class URLS {
  static const String BASE_URL =
      'https://api.unsplash.com/photos/?client_id=cf49c08b444ff4cb9e4d126b7e9f7513ba1ee58de7906e4360afc1a33d1bf4c0';
}

// ignore: camel_case_types
class api_service {
  static Future<List<dynamic>> getImage() async {
    final response = await http.get('${URLS.BASE_URL}');
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null;
    }
  }
}

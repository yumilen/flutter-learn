import 'package:http/http.dart' as http;
import 'dart:convert';


Future getJsonFromUrl(String url) async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    var json = jsonDecode(response.body);
    return json;   
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}
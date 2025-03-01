import 'dart:convert';
import 'package:newsapp/model/sourceresponse.dart';
import 'package:http/http.dart' as http;

class APIS {
  static Future<SourcesResponse> getSources() async {
    //https://newsapi.org/v2/top-headlines/sources?apiKey=07d44c267e97458b8510a9f847325dbc
    Uri url = Uri.https('newsapi.org', '/v2/top-headlines/sources',
        {'apiKey': '07d44c267e97458b8510a9f847325dbc'});

    var response = await http.get(url);
    String responseBody = response.body;
    Map<String, dynamic> json = jsonDecode(responseBody);
    //print(json['status']);
    return SourcesResponse.fromJson(json);
  }

  Future getArticles() async {
    Uri url = Uri.https('', '', {});
    var response = await http.get(url);
    String responseBody = response.body;
    var json = jsonDecode(responseBody);
  }
}

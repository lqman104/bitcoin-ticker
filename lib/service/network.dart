import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  final String _apiKey = dotenv.env['API_KEY'].toString();
  static const _baseUrl = "rest.coinapi.io";
  static const RATE_PATH = "/v1/exchangerate";

  final String path;
  final Map<String, dynamic>? queryParam;

  NetworkHelper({required this.path, this.queryParam});

  Future<dynamic> get() async {
    Uri uri = Uri.https(_baseUrl, path, queryParam);
    http.Response response =
        await http.get(uri, headers: {'X-CoinAPI-Key': _apiKey});

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}

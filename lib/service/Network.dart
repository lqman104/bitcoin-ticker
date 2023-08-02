import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {

  final String _apiKey = dotenv.env['API_KEY'].toString();
  static const _baseUrl = "rest.coinapi.io/v1";
  static const RATE_PATH = "/exchangerate";

  final String path;
  final Map<String,dynamic>? queryParam;

  NetworkHelper({required this.path, this.queryParam});

  Future<dynamic> get() async {
    Uri uri = Uri(scheme: _baseUrl, path: path, queryParameters: queryParam);
    http.Response response =  await http.get(uri, headers: {'X-CoinAPI-Key' : _apiKey});
    return jsonDecode(response.body);
  }
}
import 'package:bitcoin_ticker/service/network.dart';

class CurrencyRepository {
  static Future<Map<String, dynamic>> fetchExchangeValue({
    required String from,
    required List<String> to,
  }) async {
    Map<String, dynamic> response = {};

    for (String target in to) {
      NetworkHelper networkHelper =
          NetworkHelper(path: "${NetworkHelper.RATE_PATH}/$target/$from");

      response[target] = await networkHelper.get();
    }

    return response;
  }

  static Future<dynamic> getExchangeValue({
    required String from,
    required String to,
  }) async {
    NetworkHelper networkHelper =
        NetworkHelper(path: "${NetworkHelper.RATE_PATH}/$to/$from");
    return await networkHelper.get();
  }
}
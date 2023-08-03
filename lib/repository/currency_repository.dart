import 'package:bitcoin_ticker/service/network.dart';

class CurrencyRepository {
  static Future<dynamic> getExchangeValue({
    required String from,
    required String to,
  }) async {
    NetworkHelper networkHelper =
        NetworkHelper(path: "${NetworkHelper.RATE_PATH}/$to/$from");
    return await networkHelper.get();
  }
}
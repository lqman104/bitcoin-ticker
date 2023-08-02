import 'package:bitcoin_ticker/service/Network.dart';

class CurrencyRepository {

  static Future<dynamic> getExchangeValue(String from, String to) async {
    NetworkHelper networkHelper = NetworkHelper(path: "${NetworkHelper.RATE_PATH}/$to/$from");
    return await networkHelper.get();
  }
}
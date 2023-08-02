import 'package:bitcoin_ticker/service/network.dart';

class CurrencyRepository {
  static Future<String> getExchangeValue({
    required String from,
    required String to,
  }) async {
    NetworkHelper networkHelper =
        NetworkHelper(path: "${NetworkHelper.RATE_PATH}/$to/$from");
    var response = await networkHelper.get();
    return double.tryParse(response['rate'].toString())?.round().toString() ?? "0";
  }
}
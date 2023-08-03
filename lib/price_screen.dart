import 'package:bitcoin_ticker/convert_result_card.dart';
import 'package:bitcoin_ticker/repository/currency_repository.dart';
import 'package:bitcoin_ticker/utilities/picker.dart';
import 'package:flutter/material.dart';

Picker picker = Picker('USD');

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  List<String> coins = ['BTC', 'ETC', 'LTC'];
  late Map<String, dynamic> result;

  void getData() async {
    this.result = {};
    var result = await CurrencyRepository.fetchExchangeValue(
      from: selectedCurrency,
      to: coins,
    );
    setState(() {
      this.result = result;
    });
  }

  String getConversion(dynamic response) {
    return double.tryParse(response['rate'].toString())?.round().toString() ??
        "0";
  }

  ConvertResultCard getCard(String coin) {
    return ConvertResultCard(
      selectedCurrency: selectedCurrency,
      selectedCoin: coin,
      conversion: result[coin] == null ? '?' : getConversion(result[coin]),
    );
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: getCard('BTC'),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: getCard('ETC'),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: getCard('LTC'),
              ),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            constraints: BoxConstraints(),
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: picker.getPicker((value) {
              setState(() {
                selectedCurrency = value;
                getData();
              });
            }),
          ),
        ],
      ),
    );
  }
}

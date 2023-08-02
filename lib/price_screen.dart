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
  String selectedCoin = 'BTC';
  String conversion = '?';

   void getConversion() async {
    String result  = await CurrencyRepository.getExchangeValue(
      from: selectedCurrency,
      to: selectedCoin,
    );
    setState(() {
      conversion = result;
    });
  }

  @override
  void initState() {
    super.initState();
    getConversion();
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
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: ConvertResultCard(
              selectedCurrency: selectedCurrency,
              selectedCoin: selectedCoin,
              conversion: conversion,
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: picker.getPicker((value) {
              setState(() {
                selectedCurrency = value;
                getConversion();
              });
            }),
          ),
        ],
      ),
    );
  }
}

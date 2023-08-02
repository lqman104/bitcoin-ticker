import 'package:flutter/material.dart';

class ConvertResultCard extends StatelessWidget {
  const ConvertResultCard({
    super.key,
    required this.selectedCurrency,
    required this.selectedCoin,
    required this.conversion,
  });

  final String selectedCoin;
  final String selectedCurrency;
  final String conversion;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlueAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          '1 $selectedCoin = $conversion $selectedCurrency',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

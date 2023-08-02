import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../coin_data.dart';

class Picker {
  late String _value;

  Picker(String value) {
    this._value = value;
  }

  DropdownButton<String> getAndroidDropdown(void Function(String) callback) {
    List<DropdownMenuItem<String>> items = [];

    for (String currency in currenciesList) {
      items.add(
        DropdownMenuItem(
          child: Text(currency),
          value: currency,
        ),
      );
    }

    return DropdownButton<String>(
      value: _value,
      items: items,
      onChanged: (value) {
        if (value != null) {
          _value = value;
          callback(_value);
        }
      },
    );
  }

  CupertinoPicker getIosPicker(void Function(String) callback) {
    List<Text> items = [];

    for (String currency in currenciesList) {
      items.add(Text(currency));
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      children: items,
      onSelectedItemChanged: (index) {
        _value = currenciesList[index];
        callback(_value);
      },
      itemExtent: 32.0,
    );
  }

  Widget getPicker(void Function(String) callback) {
    return Platform.isIOS ? getIosPicker(callback) : getAndroidDropdown(callback);
  }
}

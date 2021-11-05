import 'package:flutter/material.dart';
import 'package:transposition_dictionary/config/config.dart';

class Util {
  DropdownMenuItem<int> createDdlItem(text, value) {
    return DropdownMenuItem<int>(
      child: Text(text, style: TextStyle(color: SettingConfig.color2)),
      value: value,
    );
  }
}

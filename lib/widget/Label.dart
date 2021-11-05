import 'package:flutter/material.dart';
import 'package:transposition_dictionary/config/config.dart';

class Label extends StatelessWidget {
  String textValue;
  Label(this.textValue) {}

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      margin: EdgeInsets.all(SettingConfig.commonMargin),
      height: SettingConfig.commonHeight,
      child: Center(
          child: Text(textValue,
              style: TextStyle(
                color: SettingConfig.color1,
              ))),
    ));
  }
}

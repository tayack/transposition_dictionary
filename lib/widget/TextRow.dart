import 'package:flutter/material.dart';
import 'package:transposition_dictionary/config/config.dart';

class TextRow extends StatelessWidget {
  var _textFieldControllerList;
  TextRow(this._textFieldControllerList);

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];

    for (var i = 0; i <= _textFieldControllerList.length - 1; i++) {
      list.add(
        Flexible(
          child: Container(
            margin: EdgeInsets.all(SettingConfig.commonMargin),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: SettingConfig.textBoxColor,
                border: OutlineInputBorder(),
              ),
              style: TextStyle(fontSize: 12),
              readOnly: true,
              controller: _textFieldControllerList[i],
            ),
          ),
        ),
      );
    }
    return Row(children: list);
  }
}

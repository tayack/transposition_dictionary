import 'package:flutter/material.dart';
import 'package:transposition_dictionary/config/config.dart';
import 'package:transposition_dictionary/util.dart';

class ChordButton extends StatefulWidget {
  @override
  _ChordButtonState createState() => _ChordButtonState();

  final TextEditingController _inputTextFieldController;
  final TextEditingController _outputTextFieldController;

  final String _chord;
  final _countup;
  final _isEnabled;
  var _setValueToOutput;
  ChordButton(this._inputTextFieldController, this._outputTextFieldController,
      this._countup, this._chord, this._isEnabled, this._setValueToOutput) {}
}

class _ChordButtonState extends State<ChordButton> {
  Util util = Util();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          margin: EdgeInsets.all(SettingConfig.commonMargin),
          height: SettingConfig.commonHeight,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: !widget._isEnabled
                    ? SettingConfig.color3
                    : SettingConfig.color1,
                onPrimary: SettingConfig.color2),
            onPressed: !widget._isEnabled
                ? () => {}
                : () => {
                      widget._setValueToOutput(widget._chord),
                      widget._countup()
                    },
            child: Text(widget._chord),
          )),
    );
  }
}

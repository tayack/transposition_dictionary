import 'package:flutter/material.dart';
import 'package:transposition_dictionary/config/config.dart';

class ChordButton extends StatefulWidget {
  @override
  _ChordButtonState createState() => _ChordButtonState();

  final TextEditingController _inputTextFieldController;
  final TextEditingController _outputTextFieldController;

  final String _chord;
  final _countup;
  final _isEnabled;
  var _buttonColor;
  ChordButton(this._inputTextFieldController, this._outputTextFieldController,
      this._countup, this._chord, this._isEnabled) {
    _isEnabled
        ? _buttonColor = SettingConfig.color1
        : _buttonColor = SettingConfig.color3;
  }
}

class _ChordButtonState extends State<ChordButton> {
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
                      widget._inputTextFieldController.text =
                          widget._inputTextFieldController.text + widget._chord,
                      widget._outputTextFieldController.text =
                          widget._outputTextFieldController.text +
                              widget._chord,
                      widget._countup()
                    },
            child: Text(widget._chord),
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:transposition_dictionary/widget/ChordButton.dart';
import 'package:transposition_dictionary/widget/InputDropDownlist.dart';
import 'package:transposition_dictionary/widget/Label.dart';
import 'package:transposition_dictionary/widget/TextRow.dart';

import 'config/config.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  var _inputTextFieldControllerList = [];
  var _outputTextFieldControllerList = [];

  MyApp() {
    for (var i = 0; i < 8; i++) {
      _inputTextFieldControllerList.add(TextEditingController());
      _outputTextFieldControllerList.add(TextEditingController());
    }
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _isEnabled = true;

  int _counter = 0;
  void incrementCounter() {
    setState(() {
      _isEnabled =
          !(_counter == widget._inputTextFieldControllerList.length - 1);
      if (_isEnabled) {
        _counter++;
      }
    });
  }

  void clearValues() {
    setState(() {
      for (var textFieldController in widget._inputTextFieldControllerList) {
        textFieldController.text = '';
      }

      for (var textFieldController in widget._outputTextFieldControllerList) {
        textFieldController.text = '';
      }
      _counter = 0;
      _isEnabled = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: SettingConfig.backgroundColor,
      body: Column(
        children: <Widget>[
          TextRow(widget._inputTextFieldControllerList),
          TextRow(widget._outputTextFieldControllerList),
          Row(
            children: [
              SizedBox(
                height: 10,
              )
            ],
          ),
          Row(
            children: [
              Label("Input"),
              InputDropDownlist(),
              Label("Transposition"),
              InputDropDownlist()
            ],
          ),
          Row(children: [
            ChordButton(
                widget._inputTextFieldControllerList[_counter],
                widget._outputTextFieldControllerList[_counter],
                incrementCounter,
                'C',
                _isEnabled),
            ChordButton(
                widget._inputTextFieldControllerList[_counter],
                widget._outputTextFieldControllerList[_counter],
                incrementCounter,
                'C#',
                _isEnabled),
            ChordButton(
                widget._inputTextFieldControllerList[_counter],
                widget._outputTextFieldControllerList[_counter],
                incrementCounter,
                'D',
                _isEnabled),
            ChordButton(
                widget._inputTextFieldControllerList[_counter],
                widget._outputTextFieldControllerList[_counter],
                incrementCounter,
                'E♭',
                _isEnabled),
          ]),
          Row(children: [
            ChordButton(
                widget._inputTextFieldControllerList[_counter],
                widget._outputTextFieldControllerList[_counter],
                incrementCounter,
                'C',
                _isEnabled),
            ChordButton(
                widget._inputTextFieldControllerList[_counter],
                widget._outputTextFieldControllerList[_counter],
                incrementCounter,
                'C#',
                _isEnabled),
            ChordButton(
                widget._inputTextFieldControllerList[_counter],
                widget._outputTextFieldControllerList[_counter],
                incrementCounter,
                'D',
                _isEnabled),
            ChordButton(
                widget._inputTextFieldControllerList[_counter],
                widget._outputTextFieldControllerList[_counter],
                incrementCounter,
                'E♭',
                _isEnabled),
          ]),
          Row(children: [
            ChordButton(
                widget._inputTextFieldControllerList[_counter],
                widget._outputTextFieldControllerList[_counter],
                incrementCounter,
                'C',
                _isEnabled),
            ChordButton(
                widget._inputTextFieldControllerList[_counter],
                widget._outputTextFieldControllerList[_counter],
                incrementCounter,
                'C#',
                _isEnabled),
            ChordButton(
                widget._inputTextFieldControllerList[_counter],
                widget._outputTextFieldControllerList[_counter],
                incrementCounter,
                'D',
                _isEnabled),
            ChordButton(
                widget._inputTextFieldControllerList[_counter],
                widget._outputTextFieldControllerList[_counter],
                incrementCounter,
                'E♭',
                _isEnabled),
          ]),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(SettingConfig.commonMargin),
                  height: SettingConfig.commonHeight,
                  child: ElevatedButton(
                    onPressed: () => {clearValues()},
                    child: Text('clear'),
                    style: ElevatedButton.styleFrom(
                      primary: SettingConfig.color1,
                      onPrimary: SettingConfig.color2,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SourceTextField(),
        ResultTextField(),
        Keyboard(),
      ],
    )));
  }
}

//=============================================================================
// 表示
class SourceTextField extends StatefulWidget {
  _SourceTextFieldState createState() => _SourceTextFieldState();
}

class _SourceTextFieldState extends State<SourceTextField> {
  @override
  String _expression = '1+1';
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
          color: Colors.red,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              _expression,
              style: TextStyle(
                fontSize: 64.0,
              ),
            ),
          ),
        ));
  }
}

class ResultTextField extends StatefulWidget {
  _ResultTextFieldState createState() => _ResultTextFieldState();
}

class _ResultTextFieldState extends State<ResultTextField> {
  @override
  String _expression = '1+1';
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
          color: Colors.blue,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              _expression,
              style: TextStyle(
                fontSize: 64.0,
              ),
            ),
          ),
        ));
  }
}

//　キーボタン
class Button extends StatelessWidget {
  String buttonText = "";
  Button(this.buttonText);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text(this.buttonText),
        style: ElevatedButton.styleFrom(
          primary: Colors.orange,
          onPrimary: Colors.white,
        ),
        onPressed: () {},
      ),

      // any code
    );
  }
}

class Keyboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var list = [
      'A',
      'B♭',
      'B',
      'Clear',
      'F',
      'F#',
      'G',
      'G#',
      'C',
      'C#',
      'D',
      'E♭'
    ];
    return Expanded(
        flex: 2,
        child: Center(
            child: Container(
                child: GridView.count(crossAxisCount: 4, children: [
          Button("A"),
          Button("B♭"),
          Button("B"),
          Button("clear")
        ]))));
  }
}

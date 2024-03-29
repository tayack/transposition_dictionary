import 'package:flutter/material.dart';
import 'package:transposition_dictionary/util.dart';
import 'package:transposition_dictionary/widget/ChordButton.dart';
import 'package:transposition_dictionary/widget/KeyDropDownlist.dart';
import 'package:transposition_dictionary/widget/Label.dart';
import 'package:transposition_dictionary/widget/TextRow.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'config/config.dart';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');

  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(MyApp());
}

String getTestAdBannerUnitId() {
  String testBannerUnitId = "";
  if (Platform.isAndroid) {
    // Android のとき
    testBannerUnitId = "ca-app-pub-3940256099942544/6300978111";
  } else if (Platform.isIOS) {
    // iOSのとき
    testBannerUnitId = "ca-app-pub-3940256099942544/2934735716";
  }
  return testBannerUnitId;
}

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
  int _inputKey = 1;
  int _outputKey = 1;
  Util util = Util();

  int _counter = 0;

  final BannerAd myBanner = BannerAd(
    //adUnitId: getTestAdBannerUnitId(),
    adUnitId: dotenv.env['admobid'].toString(),
    size: AdSize.banner,
    request: AdRequest(),
    listener: BannerAdListener(),
  );



  void incrementCounter() {
    setState(() {
      _isEnabled =
          !(_counter == widget._inputTextFieldControllerList.length - 1);
      if (_isEnabled) {
        _counter++;
      }
    });
  }

  void setValueToOutput(String chord) {
    setState(() {
      widget._outputTextFieldControllerList[_counter].text =
          util.getDiffChord(chord, _inputKey, _outputKey);
      widget._inputTextFieldControllerList[_counter].text = chord;
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

  void setOutputDataWithInputKey(inputkey) {
    setState(() {
      _inputKey = inputkey;
      for (var i = 0; i < 8; i++) {
        widget._outputTextFieldControllerList[i].text = util.getDiffChord(
            widget._inputTextFieldControllerList[i].text, inputkey, _outputKey);
      }
    });
  }

  void setOutputDataWithOutputKey(outputkey) {
    setState(() {
      _outputKey = outputkey;
      for (var i = 0; i < 8; i++) {
        widget._outputTextFieldControllerList[i].text = util.getDiffChord(
            widget._inputTextFieldControllerList[i].text, _inputKey, outputkey);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    myBanner.load();
    final AdWidget adWidget = AdWidget(ad: myBanner);
    return MaterialApp(
      home: Scaffold(
          backgroundColor: SettingConfig.backgroundColor,
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                  children: [Container()],
                ),
                Row(
                  children: [
                    Label("Input Key"),
                    KeyDropDownlist(setOutputDataWithInputKey),
                    Label("Output Key"),
                    KeyDropDownlist(setOutputDataWithOutputKey)
                  ],
                ),
                Row(children: [
                  ChordButton(
                      widget._inputTextFieldControllerList[_counter],
                      widget._outputTextFieldControllerList[_counter],
                      incrementCounter,
                      'C',
                      _isEnabled,
                      setValueToOutput),
                  ChordButton(
                      widget._inputTextFieldControllerList[_counter],
                      widget._outputTextFieldControllerList[_counter],
                      incrementCounter,
                      'C#',
                      _isEnabled,
                      setValueToOutput),
                  ChordButton(
                      widget._inputTextFieldControllerList[_counter],
                      widget._outputTextFieldControllerList[_counter],
                      incrementCounter,
                      'D',
                      _isEnabled,
                      setValueToOutput),
                  ChordButton(
                      widget._inputTextFieldControllerList[_counter],
                      widget._outputTextFieldControllerList[_counter],
                      incrementCounter,
                      'E♭',
                      _isEnabled,
                      setValueToOutput),
                ]),
                Row(children: [
                  ChordButton(
                      widget._inputTextFieldControllerList[_counter],
                      widget._outputTextFieldControllerList[_counter],
                      incrementCounter,
                      'E',
                      _isEnabled,
                      setValueToOutput),
                  ChordButton(
                      widget._inputTextFieldControllerList[_counter],
                      widget._outputTextFieldControllerList[_counter],
                      incrementCounter,
                      'F',
                      _isEnabled,
                      setValueToOutput),
                  ChordButton(
                      widget._inputTextFieldControllerList[_counter],
                      widget._outputTextFieldControllerList[_counter],
                      incrementCounter,
                      'F#',
                      _isEnabled,
                      setValueToOutput),
                  ChordButton(
                      widget._inputTextFieldControllerList[_counter],
                      widget._outputTextFieldControllerList[_counter],
                      incrementCounter,
                      'G',
                      _isEnabled,
                      setValueToOutput),
                ]),
                Row(children: [
                  ChordButton(
                      widget._inputTextFieldControllerList[_counter],
                      widget._outputTextFieldControllerList[_counter],
                      incrementCounter,
                      'G#',
                      _isEnabled,
                      setValueToOutput),
                  ChordButton(
                      widget._inputTextFieldControllerList[_counter],
                      widget._outputTextFieldControllerList[_counter],
                      incrementCounter,
                      'A',
                      _isEnabled,
                      setValueToOutput),
                  ChordButton(
                      widget._inputTextFieldControllerList[_counter],
                      widget._outputTextFieldControllerList[_counter],
                      incrementCounter,
                      'B♭',
                      _isEnabled,
                      setValueToOutput),
                  ChordButton(
                      widget._inputTextFieldControllerList[_counter],
                      widget._outputTextFieldControllerList[_counter],
                      incrementCounter,
                      'B',
                      _isEnabled,
                      setValueToOutput),
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
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
              child: adWidget,
              width: myBanner.size.width.toDouble(),
              height: myBanner.size.height.toDouble())),
    );
  }
}

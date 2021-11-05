import 'package:flutter/material.dart';
import 'package:transposition_dictionary/config/config.dart';
import 'package:transposition_dictionary/util.dart';

class InputDropDownlist extends StatefulWidget {
  @override
  _InputDropDownlistState createState() => _InputDropDownlistState();
}

class _InputDropDownlistState extends State<InputDropDownlist> {
  @override
  Widget build(BuildContext context) {
    var util = Util();

    return Expanded(
      child: Container(
        margin: EdgeInsets.all(SettingConfig.commonMargin),
        height: SettingConfig.commonHeight,
        decoration: BoxDecoration(
          color: SettingConfig.color1,
          borderRadius: BorderRadius.circular(5),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            dropdownColor: SettingConfig.color1,
            value: 1,
            onChanged: (value) => {},
            items: [
              util.createDdlItem("C", 1),
              util.createDdlItem("C#", 2),
              util.createDdlItem("D", 3),
              util.createDdlItem("E♭", 4),
              util.createDdlItem("E", 5),
              util.createDdlItem("F", 6),
              util.createDdlItem("F#", 7),
              util.createDdlItem("G", 8),
              util.createDdlItem("G#", 9),
              util.createDdlItem("A", 10),
              util.createDdlItem("B♭", 11),
              util.createDdlItem("B", 12),
            ],
          ),
        ),
      ),
    );
  }
}

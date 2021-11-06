import 'package:flutter/material.dart';
import 'package:transposition_dictionary/config/config.dart';
import 'package:transposition_dictionary/util.dart';

class InputDropDownlist extends StatefulWidget {
  @override
  _InputDropDownlistState createState() => _InputDropDownlistState();
}

class _InputDropDownlistState extends State<InputDropDownlist> {
  List<DropdownMenuItem<int>> _items = [];
  int _selectedValue = 1;

  @override
  void initState() {
    super.initState();
    setItems();
  }

  void setItems() {
    var util = Util();
    _items.add(util.createDdlItem("C", 1));
    _items.add(util.createDdlItem("C#", 2));
    _items.add(util.createDdlItem("D", 3));
    _items.add(util.createDdlItem("E♭", 4));
    _items.add(util.createDdlItem("E", 5));
    _items.add(util.createDdlItem("F", 6));
    _items.add(util.createDdlItem("F#", 7));
    _items.add(util.createDdlItem("G", 8));
    _items.add(util.createDdlItem("G#", 9));
    _items.add(util.createDdlItem("A", 10));
    _items.add(util.createDdlItem("B♭", 11));
    _items.add(util.createDdlItem("B", 12));
  }

  @override
  Widget build(BuildContext context) {
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
            onChanged: (value) => {
              setState(() {
                _selectedValue = int.parse(value.toString());
              })
            },
            value: _selectedValue,
            items: _items,
          ),
        ),
      ),
    );
  }
}

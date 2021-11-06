import 'package:flutter/material.dart';
import 'package:transposition_dictionary/config/config.dart';

class Util {
  Map<String, int> chordDictionary = {
    'C': 1,
    'C#': 2,
    'D': 3,
    'E♭': 4,
    'E': 5,
    'F': 6,
    'F#': 7,
    'G': 8,
    'G#': 9,
    'A': 10,
    'B♭': 11,
    'B': 12
  };
  Map<int, String> chordDictionary2 = {
    1: 'C',
    2: 'C#',
    3: 'D',
    4: 'E♭',
    5: 'E',
    6: 'F',
    7: 'F#',
    8: 'G',
    9: 'G#',
    10: 'A',
    11: 'B♭',
    12: 'B'
  };

  DropdownMenuItem<int> createDdlItem(text, value) {
    return DropdownMenuItem<int>(
      child: Text(text, style: TextStyle(color: SettingConfig.color2)),
      value: value,
    );
  }

  String getDiffChord(String chord, int inputKey, int outputKey) {
    int resultInt =
        (int.parse(chordDictionary[chord].toString()) + inputKey - outputKey) %
            12;
    return chordDictionary2[resultInt].toString();
  }
}

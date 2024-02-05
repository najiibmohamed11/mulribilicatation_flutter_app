import 'dart:math';

import 'package:flutter/material.dart';

var random = Random();

class Data_calculations {
  Data_calculations({@required this.userinput});

  int n1 = random.nextInt(100);
  int n2 = random.nextInt(100);
  int? userinput;

  bool answerChecker() { // Corrected method name
    return n1 * n2 == userinput;
  }
}
